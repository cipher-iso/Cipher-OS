--    ┏┓┏┓┳┓┏┓┏┓┳┓┏┓┓┏┏┓┏┳┓
--    ┗┓┃ ┣┫┣ ┣ ┃┃┗┓┣┫┃┃ ┃ 
--    ┗┛┗┛┛┗┗┛┗┛┛┗┗┛┛┗┗┛ ┻ 
local function Screenshot(mode)
    local state_file = os.getenv("HOME") .. "/Scripts/.Screenshare-ON"
    local done_file  = "/tmp/.hyprshot_done"
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
    hl.exec_cmd("rm -f " .. done_file)
    hl.exec_cmd("bash -c 'hyprshot -z -m " .. mode .. " --output-folder ~/Pictures/Screenshots/ --silent; touch " .. done_file .. "'")
    local attempts = 0
    local poll
    poll = hl.timer(function()
        attempts = attempts + 1
        if attempts >= 300 then
            poll:set_enabled(false)
            hl.exec_cmd("rm -f " .. done_file)
            if did_expose then protect() end
            return
        end
        if not file_exists(done_file) then return end
        poll:set_enabled(false)
        hl.exec_cmd("rm -f " .. done_file)
        if did_expose then protect() end
    end, { timeout = 100, type = "repeat" })
end

function CaptureRegion() Screenshot("region")          end
function CaptureWindow() Screenshot("window -m active") end
