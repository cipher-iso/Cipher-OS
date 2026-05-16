--    ┏┓┳┳┏┳┓┏┓┳┳┓┏┓┏┳┓┳┏┓  ┏┓┏┳┓┏┓┳┓┏┳┓┳┳┏┓
--    ┣┫┃┃ ┃ ┃┃┃┃┃┣┫ ┃ ┃┃ ━━┗┓ ┃ ┣┫┣┫ ┃ ┃┃┃┃
--    ┛┗┗┛ ┻ ┗┛┛ ┗┛┗ ┻ ┻┗┛  ┗┛ ┻ ┛┗┛┗ ┻ ┗┛┣┛
hl.on("hyprland.start", function()
---@diagnostic disable: undefined-global

-- [ HYPRLAND SPECIFIC ]
hl.exec_cmd(XDPH)	-- Hyprland Portals
hl.exec_cmd(Polkit)	-- Authentication Agent

-- [ GUI STARTUP ]
hl.exec_cmd(OBS)		-- OBS
hl.exec_cmd("steam")            -- Steam
hl.exec_cmd(Discord)            -- Discord
hl.exec_cmd(Browser)            -- Browser
hl.exec_cmd(EasyEffects)	-- Mic Equalizer

-- [ BACKGROUND STARTUP ]
hl.exec_cmd(Listener)                                   -- Color-Schemes
hl.exec_cmd(Sunshine)                                   -- Remote-Desktop
hl.exec_cmd("waypaper --random")                        -- Wallpaper Restoration
hl.exec_cmd("hyprctl eval 'ReloadSystem()'")		-- Reload System Functions
hl.exec_cmd("wl-clip-persist --clipboard regular")	-- Persist Clipboard History
hl.exec_cmd("hyprctl eval 'Screenshare_Restore()'")	-- Restore ScreenShare State
hl.exec_cmd("swayosd-client --input-volume mute-toggle")-- Mute Microphone on Startup

-- [ TUI STARTUP ]
hl.exec_cmd(Terminal .. " kew", { workspace = "5 silent" })	-- Music Player
hl.exec_cmd(Terminal .. " btop", { workspace = "5 silent" })    -- System Monitor

-- [ FUNCTIONS ]
hl.timer(function()
    hl.exec_cmd("hyprctl eval 'DiscordInhibitor()'")
end, { timeout = 30000, type = "repeat" })

end)
