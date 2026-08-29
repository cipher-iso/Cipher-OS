--    ┳┳┓┳┳┏┳┓┏┓  ┏┓┏┓┏┳┓┳┓┏┏┓  ┓ ┏┳┳┓┳┓┏┓┓ ┏
--    ┃┃┃┃┃ ┃ ┣   ┣┫┃  ┃ ┃┃┃┣ ━━┃┃┃┃┃┃┃┃┃┃┃┃┃
--    ┛ ┗┗┛ ┻ ┗┛  ┛┗┗┛ ┻ ┻┗┛┗┛  ┗┻┛┻┛┗┻┛┗┛┗┻┛

local function get_descendant_pids(root_pid)
    local children = {}
    local handle = io.popen("ps -eo pid,ppid --no-headers 2>/dev/null")
    if handle then
        for line in handle:lines() do
            local pid, ppid = line:match("^%s*(%d+)%s+(%d+)")
            if pid and ppid then
                pid, ppid = tonumber(pid), tonumber(ppid)
                children[ppid] = children[ppid] or {}
                table.insert(children[ppid], pid)
            end
        end
        handle:close()
    end

    local pids = { [root_pid] = true }
    local stack = { root_pid }
    while #stack > 0 do
        local p = table.remove(stack)
        for _, c in ipairs(children[p] or {}) do
            if not pids[c] then
                pids[c] = true
                table.insert(stack, c)
            end
        end
    end
    return pids
end

local function get_sink_inputs()
    local results = {}
    local handle = io.popen("pactl list sink-inputs 2>/dev/null")
    if handle then
        local cur = nil
        for line in handle:lines() do
            local idx = line:match("^Sink Input #(%d+)")
            if idx then
                cur = { index = tonumber(idx) }
                table.insert(results, cur)
            end
            if cur then
                local muted = line:match("^%s*Mute:%s*(%a+)")
                if muted then cur.muted = (muted == "yes") end

                local pid = line:match('application%.process%.id = "(%d+)"')
                if pid then cur.pid = tonumber(pid) end

                local appname = line:match('application%.name = "(.-)"')
                if appname then cur.appname = appname end

                local medianame = line:match('media%.name = "(.-)"')
                if medianame then cur.medianame = medianame end
            end
        end
        handle:close()
    end
    return results
end

local function contains_ci(haystack, needle)
    if not haystack or not needle or needle == "" then return false end
    return haystack:lower():find(needle:lower(), 1, true) ~= nil
end

function MuteActive()
    local w = hl.get_active_window()
    if w == nil then
        hl.notification.create({ text = "  [  NO CLIENT FOUND!  ]", timeout = 3000, icon = "error", font_size = 20 })
        return
    end

    local sink_inputs = get_sink_inputs()
    local win_title = w.initial_title

    local matched = {}

    for _, s in ipairs(sink_inputs) do
        if (s.appname and s.appname == win_title) or (s.medianame and s.medianame == win_title) then
            table.insert(matched, s)
        end
    end

    if #matched == 0 then
        for _, s in ipairs(sink_inputs) do
            if contains_ci(s.appname, win_title) or contains_ci(s.medianame, win_title)
                or contains_ci(s.appname, w.class) or contains_ci(s.medianame, w.class) then
                table.insert(matched, s)
            end
        end
    end

    if #matched == 0 then
        local pid_set = get_descendant_pids(w.pid)
        for _, s in ipairs(sink_inputs) do
            if s.pid and pid_set[s.pid] then
                table.insert(matched, s)
            end
        end
    end

    if #matched == 0 then
        hl.notification.create({ text = "  [  NO CLIENT FOUND - " .. win_title .. "  ]", timeout = 3000, icon = "error", font_size = 20 })
        return
    end

    local target_mute = not matched[1].muted
    for _, s in ipairs(matched) do
        os.execute("pactl set-sink-input-mute " .. s.index .. " " .. (target_mute and 1 or 0) .. " &")
    end

    local verb = target_mute and "MUTED -" or "UNMUTED -"
    hl.notification.create({
        text = "  [  " .. verb .. " " .. win_title .. "  ]",
        timeout = 3000,
        icon = "ok",
        font_size = 20
    })
end
