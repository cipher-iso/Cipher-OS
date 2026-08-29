--    ┏┓┳┳┏┳┓┏┓┳┳┓┏┓┏┳┓┳┏┓  ┏┓┏┳┓┏┓┳┓┏┳┓┳┳┏┓
--    ┣┫┃┃ ┃ ┃┃┃┃┃┣┫ ┃ ┃┃ ━━┗┓ ┃ ┣┫┣┫ ┃ ┃┃┃┃
--    ┛┗┗┛ ┻ ┗┛┛ ┗┛┗ ┻ ┻┗┛  ┗┛ ┻ ┛┗┛┗ ┻ ┗┛┣┛
hl.on("hyprland.start", function()

-- [ HYPRLAND SPECIFIC ]
--ToggleHDR()		-- Enable HDR
ReloadSystem()		-- Restore Shell[s]
hl.exec_cmd(XDPH)	-- Hyprland Portals
hl.exec_cmd(Polkit)	-- Authentication Agent
Screenshare_Restore()	-- Restore ScreenShare State

-- [ GUI STARTUP ]
--hl.exec_cmd(OBS)		-- OBS
hl.exec_cmd("steam")		-- Steam
hl.exec_cmd(Discord)		-- Discord
hl.exec_cmd(Browser)		-- Browser
hl.exec_cmd(EasyEffects)	-- Mic Equalizer
hl.exec_cmd("audacious")	-- Music Player

-- [ BACKGROUND STARTUP ]
hl.exec_cmd(Listener)                                 	-- Color-Schemes
hl.exec_cmd(Sunshine)                             	-- Remote-Desktop
hl.exec_cmd("waypaper --random")                 	-- Wallpaper Restoration
hl.exec_cmd("wl-clip-persist --clipboard regular")	-- Persist Clipboard History

-- [ TUI STARTUP ]
hl.exec_cmd(Terminal .. " btop", { workspace = "4 silent" })	-- System Monitor
--hl.exec_cmd(Terminal .. " kew", { workspace = "4 silent" })	-- Music Player

end)
