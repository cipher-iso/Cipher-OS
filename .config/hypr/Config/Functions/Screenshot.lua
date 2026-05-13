--    ┏┓┏┓┳┓┏┓┏┓┳┓┏┓┓┏┏┓┏┳┓
--    ┗┓┃ ┣┫┣ ┣ ┃┃┗┓┣┫┃┃ ┃ 
--    ┗┛┗┛┛┗┗┛┗┛┛┗┗┛┛┗┗┛ ┻ 
--    [ MOD + F13 = REGION | + SHIFT = WINDOW ]
function Screenshot(mode)
    local state_file = os.getenv("HOME") .. "/Scripts/.Screenshare-ON"
    local done_file  = "/tmp/.hyprshot_done"

    -- [ HELPERS ]
    local function file_exists(path)
        local f = io.open(path, "r")
        if f then f:close() return true end
        return false
    end

    local function expose()
        hl.window_rule({ name = "SCREENSHARE", no_screen_share = false, match = { class = "^(discord|vivaldi-stable|steam)$" } })
        os.execute("touch " .. state_file)
    end

    local function protect()
        hl.window_rule({ name = "SCREENSHARE", no_screen_share = true, match = { class = "^(discord|vivaldi-stable|steam)$" } })
        os.remove(state_file)
    end

    -- [ EXPOSE IF CURRENTLY PROTECTED ]
    local did_expose = false
    if not file_exists(state_file) then
        expose()
        did_expose = true
    end

    -- [ LAUNCH HYPRSHOT DETACHED, TOUCH DONE FILE WHEN FINISHED ]
    os.remove(done_file)
    hl.exec_cmd("bash -c 'hyprshot -z -m " .. mode .. " --output-folder ~/Pictures/Screenshots/ --silent; touch " .. done_file .. "'")

    -- [ POLL FOR DONE FILE ]
    local attempts = 0
    local poll
    poll = hl.timer(function()
        attempts = attempts + 1

        -- [ GIVE UP AFTER 30S ]
        if attempts >= 300 then
            poll:set_enabled(false)
            os.remove(done_file)
            if did_expose then protect() end
            return
        end

        if not file_exists(done_file) then return end

        -- [ HYPRSHOT FINISHED ]
        poll:set_enabled(false)
        os.remove(done_file)
        if did_expose then protect() end
    end, { timeout = 100, type = "repeat" })
end
