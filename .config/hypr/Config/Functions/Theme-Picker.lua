--    ┏┳┓┓┏┏┓┳┳┓┏┓  ┏┓┳┏┓┓┏┓┏┓┳┓
--     ┃ ┣┫┣ ┃┃┃┣ ━━┃┃┃┃ ┃┫ ┣ ┣┫
--     ┻ ┛┗┗┛┛ ┗┗┛  ┣┛┻┗┛┛┗┛┗┛┛┗
function ThemePicker()
    local state_file  = os.getenv("HOME") .. "/Scripts/.Screenshare-ON"
    local identifiers = os.getenv("HOME") .. "/.config/hypr/Config/Identifiers.lua"
    local tmp_file    = "/tmp/.hyprpicker_color"

    local function file_exists(path)
        local f = io.open(path, "r")
        if f then f:close() return true end
        return false
    end

    local function expose()
        hl.window_rule({ name = "SCREENSHARE", no_screen_share = false, match = { class = "^(discord|vivaldi-stable|steam)$" } })
        hl.exec_cmd("touch " .. state_file)
    end
    local function protect()
        hl.window_rule({ name = "SCREENSHARE", no_screen_share = true, match = { class = "^(discord|vivaldi-stable|steam)$" } })
        hl.exec_cmd("rm -f " .. state_file)
    end

    local did_expose = false
    if not file_exists(state_file) then
        expose()
        did_expose = true
    end

    -- [ LAUNCH HYPRPICKER ]
    hl.exec_cmd("rm -f " .. tmp_file)
    hl.exec_cmd("bash -c 'hyprpicker -a 2>/dev/null | tr -d \"#\\n\" > " .. tmp_file .. "'")

    -- [ POLL FOR RESULT EVERY 500MS, GIVE UP AFTER 30S ]
    local attempts = 0
    local reloaded = false
    local poll
    poll = hl.timer(function()
        attempts = attempts + 1

        if attempts >= 60 then
            hl.exec_cmd("rm -f " .. tmp_file)
            if did_expose then protect() end
            poll:set_enabled(false)
            return
        end

        local f = io.open(tmp_file, "r")
        if not f then return end
        local picked_color = f:read("*a"):gsub("%s+", "")
        f:close()

        if not picked_color:match("^%x%x%x%x%x%x$") then return end

        poll:set_enabled(false)
        hl.exec_cmd("rm -f " .. tmp_file)
        hl.exec_cmd(string.format("sed -i 's|^PRIMARY[[:space:]]*=.*|PRIMARY      = \"%s\"|' %s", picked_color, identifiers))
        if did_expose then protect() end

        hl.timer(function()
            if not reloaded then
                reloaded = true
                ReloadSystem()
            end
        end, { timeout = 100, type = "oneshot" })

    end, { timeout = 500, type = "repeat" })
end
