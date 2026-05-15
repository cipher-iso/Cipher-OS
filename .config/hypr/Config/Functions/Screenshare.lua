--    ┏┓┏┓┳┓┏┓┏┓┳┓┏┓┓┏┏┓┳┓┏┓
--    ┗┓┃ ┣┫┣ ┣ ┃┃┗┓┣┫┣┫┣┫┣ 
--    ┗┛┗┛┛┗┗┛┗┛┛┗┗┛┛┗┛┗┛┗┗┛
local screenshare_state  = os.getenv("HOME") .. "/Scripts/.Screenshare-ON"
local screenshare_active = io.open(screenshare_state, "r") ~= nil

local function apply_screenshare(active)
    local color   = active and SECONDARY or PRIMARY
    local opacity = active and "02)"     or "02)"
    hl.window_rule({ name = "WORKSPACES", decorate = active })
    hl.window_rule({ name = "SCREENSHARE", no_screen_share = not active })
    hl.config({ general	= { ["col.active_border"] = "rgb(" .. color .. ")" } })
    hl.config({ decoration = {
    	    	shadow 	= { color = "rgba(" .. color .. opacity },
    		glow 	= { enabled = active, color = "rgba(" .. color .. "20)" } } })
end

function Screenshare()
    ---@diagnostic disable: undefined-global
    screenshare_active = not screenshare_active
    if screenshare_active then
        io.open(screenshare_state, "w"):close()
        hl.notification.create({ text = "  [  SESSION EXPOSED  ]",   timeout = 3000, icon = "warning", font_size = 16 })
    else
        os.remove(screenshare_state)
        hl.notification.create({ text = "  [  SESSION INCOGNITO  ]", timeout = 3000, icon = "ok",      font_size = 16 })
    end
    apply_screenshare(screenshare_active)
end

--    ┏┓┏┓┳┓┏┓┏┓┳┓┏┓┓┏┏┓┳┓┏┓ ┳┓┏┓┏┓┏┳┓┏┓┳┓┏┓
--    ┗┓┃ ┣┫┣ ┣ ┃┃┗┓┣┫┣┫┣┫┣  ┣┫┣ ┗┓ ┃ ┃┃┣┫┣ 
--    ┗┛┗┛┛┗┗┛┗┛┛┗┗┛┛┗┛┗┛┗┗┛ ┛┗┗┛┗┛ ┻ ┗┛┛┗┗┛
function Screenshare_Restore()
    apply_screenshare(screenshare_active)
    if screenshare_active then
        local w = hl.get_active_window()
        if w ~= nil then
            hl.dispatch(hl.dsp.focus({ window = "address:" .. w.address }))
        end
    end
end
