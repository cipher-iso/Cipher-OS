--    ┏┓┳┳┏┳┓┏┓┳┳┓┏┓┏┳┓┳┏┓  ┏┓┏┳┓┏┓┳┓┏┳┓┳┳┏┓
--    ┣┫┃┃ ┃ ┃┃┃┃┃┣┫ ┃ ┃┃ ━━┗┓ ┃ ┣┫┣┫ ┃ ┃┃┃┃
--    ┛┗┗┛ ┻ ┗┛┛ ┗┛┗ ┻ ┻┗┛  ┗┛ ┻ ┛┗┛┗ ┻ ┗┛┣┛
hl.on("hyprland.start", function()

-- [ BACKGROUND STARTUP ]
hl.exec_cmd("Waybar")                                           -- Waybar Script
hl.exec_cmd(Listener)                                           -- Color-Schemes
hl.exec_cmd(Sunshine)                                           -- Remote-Desktop
hl.exec_cmd("solaar -w hide")                                   -- Logitech Software
hl.exec_cmd("vicinae server")                                   -- Application Launcher
hl.exec_cmd("waypaper --random")                                -- Wallpaper Restoration
hl.exec_cmd("swaync")                                           -- Notifications & OSD
hl.exec_cmd("swayosd-server")                                   -- Notifications & OSD
hl.exec_cmd("wl-clip-persist --clipboard regular")              -- Clipboard History

-- [ HYPRLAND SPECIFIC ]
hl.exec_cmd(XDPH)			-- Hyprland Portals
hl.exec_cmd(Polkit)                 	-- Authentication Agent
hl.exec_cmd("hypridle")             	-- Auto-Lockscreen & Sleep
hl.exec_cmd("hyprpm reload")        	-- Reload Hyprland Config
hl.exec_cmd("hyprsunset -i")        	-- Blue-Light Disable & Gamma
hl.exec_cmd("ScreenShare Borders")  	-- Restore ScreenShare State

-- [ GUI STARTUP ]
hl.exec_cmd(OBS)		-- OBS
hl.exec_cmd("steam")            -- Steam
hl.exec_cmd(Discord)            -- Discord
hl.exec_cmd(Browser)            -- Browser
hl.exec_cmd(EasyEffects)        -- Mic Equalizer

-- [ TUI STARTUP ]
hl.exec_cmd(Terminal .. " kew", { workspace = "5", silent = true })	-- Music Player
hl.exec_cmd(Terminal .. " btop", { workspace = "5", silent = true })    -- System Monitor
-- hl.exec_cmd(Terminal .. " MC-Server", { workspace = "5", silent = true }) -- Minecraft Server

-- [ PLUGIN CONFIG ]
-- Applied after a delay to ensure hyprpm has finished loading plugins
hl.timer(function()
hl.config({
    plugin = {
    	hyprexpo = {
		gap_size         = 20,
		bg_col           = "rgb(" .. BACKGROUND .. ")",
		workspace_method = "first 1",
    	},
    },
})
    end, { timeout = 2000, type = "oneshot" })
end)
