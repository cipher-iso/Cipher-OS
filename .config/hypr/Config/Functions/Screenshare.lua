---@diagnostic disable: undefined-global
--    ┏┓┏┓┳┓┏┓┏┓┳┓┏┓┓┏┏┓┳┓┏┓
--    ┗┓┃ ┣┫┣ ┣ ┃┃┗┓┣┫┣┫┣┫┣ 
--    ┗┛┗┛┛┗┗┛┗┛┛┗┗┛┛┗┛┗┛┗┗┛
local screenshare_state  = os.getenv("HOME") .. "/Scripts/.Screenshare-ON"
local screenshare_active = io.open(screenshare_state, "r") ~= nil
function Screenshare()
    screenshare_active = not screenshare_active
    if screenshare_active then
        -- [ SESSION EXPOSED ]
        io.open(screenshare_state, "w"):close()
        hl.window_rule({ name = "SCREENSHARE", no_screen_share = false, match = { class = "^(discord|vivaldi-stable|steam)$" } })
        hl.window_rule({ name = "WORKSPACES",  opaque = true, decorate = true,  rounding = 0, match = { float = false, workspace = "w[tv1]s[false]" } })
        hl.config({ decoration = { shadow = { color = "rgba(" .. SECONDARY .. "02)" } } })
        hl.config({ general  = { ["col.active_border"] = "rgb(" .. SECONDARY .. ")" } })
        hl.notification.create({ text = "  [  SESSION EXPOSED  ]",   timeout = 3000, icon = "warning", font_size = 16 })
    else
        -- [ SESSION INCOGNITO ]
        os.remove(screenshare_state)
        hl.window_rule({ name = "SCREENSHARE", no_screen_share = true,  match = { class = "^(discord|vivaldi-stable|steam)$" } })
        hl.window_rule({ name = "WORKSPACES",  opaque = true, decorate = false, rounding = 0, match = { float = false, workspace = "w[tv1]s[false]" } })
        hl.config({ decoration = { shadow = { color = "rgba(" .. PRIMARY .. "02)" } } })
        hl.config({ general  = { ["col.active_border"] = "rgb(" .. PRIMARY .. ")" } })
        hl.notification.create({ text = "  [  SESSION INCOGNITO  ]", timeout = 3000, icon = "ok", font_size = 16 })
    end
end
hl.bind(MOD .. " + grave", Screenshare)

--    ┏┓┏┓┳┓┏┓┏┓┳┓┏┓┓┏┏┓┳┓┏┓ ┳┓┏┓┏┓┏┳┓┏┓┳┓┏┓
--    ┗┓┃ ┣┫┣ ┣ ┃┃┗┓┣┫┣┫┣┫┣  ┣┫┣ ┗┓ ┃ ┃┃┣┫┣ 
--    ┗┛┗┛┛┗┗┛┗┛┛┗┗┛┛┗┛┗┛┗┗┛ ┛┗┗┛┗┛ ┻ ┗┛┛┗┗┛
function Screenshare_Restore()
    if not screenshare_active then
        -- [ RESTORE DEFAULT BORDERS ]
        hl.window_rule({ name = "WORKSPACES",  opaque = true, decorate = false, rounding = 0, match = { float = false, workspace = "w[tv1]s[false]" } })
        hl.window_rule({ name = "SCREENSHARE", no_screen_share = true,  match = { class = "^(discord|vivaldi-stable|steam)$" } })
        hl.config({ decoration = { shadow = { color = "rgba(" .. PRIMARY .. "02)" } } })
        hl.config({ general  = { ["col.active_border"] = "rgb(" .. PRIMARY .. ")" } })
    else
        -- [ RESTORE SCREENSHARING BORDERS ]
        hl.window_rule({ name = "WORKSPACES",  opaque = true, decorate = true,  rounding = 0, match = { float = false, workspace = "w[tv1]s[false]" } })
        hl.window_rule({ name = "SCREENSHARE", no_screen_share = false, match = { class = "^(discord|vivaldi-stable|steam)$" } })
        hl.config({ decoration = { shadow = { color = "rgba(" .. SECONDARY .. "01)" } } })
        hl.config({ general  = { ["col.active_border"] = "rgb(" .. SECONDARY .. ")" } })
        local w = hl.get_active_window()
        if w ~= nil then
            hl.dispatch(hl.dsp.focus({ window = "address:" .. w.address }))
        end
    end
end
