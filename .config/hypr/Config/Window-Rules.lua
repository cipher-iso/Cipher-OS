--    ┓ ┏┳┳┓┳┓┏┓┓ ┏  ┳┓┳┳┓ ┏┓┏┓
--    ┃┃┃┃┃┃┃┃┃┃┃┃┃━━┣┫┃┃┃ ┣ ┗┓
--    ┗┻┛┻┛┗┻┛┗┛┗┻┛  ┛┗┗┛┗┛┗┛┗┛
-- [ DEFINED WORKSPACES ]
hl.window_rule({ workspace = "1",         opaque = true, focus_on_activate = true, no_vrr = true, match = { class = "vivaldi-stable|mpv" } })
hl.window_rule({ workspace = "2 silent",  match = { class = "discord" } })
hl.window_rule({ workspace = "3 silent",  match = { class = "steam", title = "^(Steam|Sign in to Steam)$" } })
hl.window_rule({ workspace = "4 silent",  render_unfocused = true, match = { class = "obs" } })
hl.window_rule({ workspace = "6",         opaque = true, match = { class = "resolve" } })
hl.window_rule({ workspace = "9 silent",  opaque = true, match = { title = "^.*(Prism|Minecraft).*$" } })

--    ┏┓┏┓┏┳┓┏┓┏┓┏┓┳┓┳┏┓┏┓
--    ┃ ┣┫ ┃ ┣ ┃┓┃┃┣┫┃┣ ┗┓
--    ┗┛┛┗ ┻ ┗┛┗┛┗┛┛┗┻┗┛┗┛
hl.window_rule({ name = "SCREENSHARE",  -- [ SCREENSHARING ]
	no_screen_share = true,
	match = { class = "^(discord|vivaldi-stable|steam)$" }
})
hl.window_rule({ name = "MEDIA",        -- [ MEDIA MENU ]
	workspace = "special:media silent",
	match = { class = "^(.*easyeffects)$" }
})
hl.window_rule({                        -- [ GAMING ]
	name             = "GAMES",
	content          = "game",
	workspace        = "9 silent",
	idle_inhibit     = "always",
	opaque           = true,
	no_dim           = true,
	no_anim          = true,
	no_blur          = true,
	decorate         = false,
	no_shadow        = true,
	fullscreen       = true,
	sync_fullscreen  = true,
	render_unfocused = true,
	match = { class = "^.*(steam_app_|cs2|RimWorldLinux|osu!|Sober|gamescope).*$" }
})
hl.window_rule({                        -- [ FLOATS - NO FORCED SIZING ]
	name     = "FLOAT ONLY",
	float    = true,
	center   = true,
	max_size = "monitor_w*0.75 monitor_h*0.7",
	match = { title = "^(.*Vivaldi Settings.*|OBS Studio Crash Detected|.*1659040.*)$" }
})
hl.window_rule({                        -- [ SMALL FLOATS ]
	name   = "FLOAT SMALL",
	float  = true,
	center = true,
	size   = "monitor_w*0.2 monitor_h*0.35",
	match = { class = "^(blueman-manager|com.network.manager|.*pupgui2|.*share-picker|solaar)$" }
})
hl.window_rule({                        -- [ MEDIUM FLOATS ]
	name   = "FLOAT MEDIUM",
	float  = true,
	center = true,
	size   = "monitor_w*0.45 monitor_h*0.5",
	match = { class = "^(pavucontrol-qt|.*lsfg|.*xdg-.*|Update|org.kde.ark)$" }
})
hl.window_rule({                        -- [ LARGE FLOATS ]
	name   = "FLOAT LARGE",
	float  = true,
	center = true,
	size   = "monitor_w*0.5 monitor_h*0.58",
	match = { class = "^(.*dolphin.*|qimgv|mpv|timeshift-gtk|.*easyeffects)$" }
})

--    ┓ ┏┏┓┳┓┓┏┓┏┓┏┓┏┓┏┓┏┓  ┳┓┳┳┓ ┏┓┏┓
--    ┃┃┃┃┃┣┫┃┫ ┗┓┃┃┣┫┃ ┣ ━━┣┫┃┃┃ ┣ ┗┓
--    ┗┻┛┗┛┛┗┛┗┛┗┛┣┛┛┗┗┛┗┛  ┛┗┗┛┗┛┗┛┗┛
hl.workspace_rule({ workspace = "1", persistent = true })
hl.workspace_rule({ workspace = "2", persistent = true })
hl.workspace_rule({ workspace = "3", persistent = true })
hl.workspace_rule({ workspace = "4", persistent = true })
hl.workspace_rule({ workspace = "5", persistent = true })
hl.workspace_rule({ workspace = "6", persistent = true })
hl.workspace_rule({ workspace = "7", persistent = true })
hl.workspace_rule({ workspace = "8", persistent = true })
hl.workspace_rule({ workspace = "9", persistent = true })

hl.workspace_rule({ workspace = "w[tv1]s[false]", gaps_out = 0, gaps_in = 0 })
hl.workspace_rule({ workspace = "f[1]s[false]",   gaps_out = 0, gaps_in = 0 })

hl.window_rule({ name = "WORKSPACES",
	opaque      = true,
	decorate    = false,
	match = { float = false, workspace = "w[tv1]s[false]" }
})

--    ┏┓┳┳┏┓┓ ┳┏┳┓┓┏  ┏┓┏┓  ┓ ┳┏┓┏┓
--    ┃┃┃┃┣┫┃ ┃ ┃ ┗┫━━┃┃┣ ━━┃ ┃┣ ┣ 
--    ┗┻┗┛┛┗┗┛┻ ┻ ┗┛  ┗┛┻   ┗┛┻┻ ┗┛
-- [ HYPRLAND 'FIXES' ]
hl.window_rule({ suppress_event = "maximize", match = { class = ".*" } })
hl.window_rule({ allows_input = true, no_blur = true, opaque = true, no_focus = true, match = { class = "^$", title = "^$", xwayland = 1, float = 1, fullscreen = 0, pin = 0 } })
hl.window_rule({ no_vrr = true, idle_inhibit = "focus", match = { content = "video" } })

-- [ STEAM SUB-WINDOWS ]
hl.window_rule({ center = true, match = { class = "steam", title = "negative:^()$" } })
hl.window_rule({ move = "571 166", match = { class = "steam", title = "^(Steam Settings)$" } })
hl.window_rule({ opacity = 0, no_focus = true, no_blur = true, match = { title = "^(.*AntiCheat.*)$" } })
hl.window_rule({ no_dim = true, focus_on_activate = true, float = true, match = { class = "steam", initial_title = "negative:Steam" } })
hl.window_rule({ min_size = "1 1", allows_input = true, pin = true, float = true, opaque = true, no_dim = true, match = { title = "^(.*notificationtoasts.*)$" } })

-- [ DOLPHIN SUB-WINDOWS ]
hl.window_rule({ min_size = "1 1", move = "(865) (718)", size = "monitor_w*0.3 monitor_h*0.14", match = { title = "^(.*Copying —.*|.*Folder —.*)$" } })
hl.window_rule({ min_size = "1 1", move = "(865) (343)", size = "monitor_w*0.3 monitor_h*0.25", match = { title = "^(.*Exists —.*|.*Dialog —.*)$" } })

-- [ PICTURE-IN-PICTURE ]
hl.window_rule({ float = true, opaque = true, size = "640 360", pin = true, move = "(1875) (1035)", no_dim = true, no_initial_focus = true, match = { title = "^(Picture in picture|Discord Popout)$" } })

-- [ CUSTOM FLOATS ]
hl.window_rule({ float = true, center = true, size = "780 980", max_size = "780 980", min_size = "780 980", match = { class = "waypaper" } })
hl.window_rule({ workspace = "9 silent", float = true, center = true, match = { class = ".*exe" } })

--    ┓ ┏┓┓┏┏┓┳┓  ┳┓┳┳┓ ┏┓┏┓
--    ┃ ┣┫┗┫┣ ┣┫━━┣┫┃┃┃ ┣ ┗┓
--    ┗┛┛┗┗┛┗┛┛┗  ┛┗┗┛┗┛┗┛┗┛
-- [ OSD | LAYER | LAUNCHER BLUR ]
hl.layer_rule({ no_anim = true, match = { namespace = "selection" } })
hl.layer_rule({ blur = true, blur_popups = true, ignore_alpha = 0, match = { namespace = "^(waybar|swaync-notification-window|swayosd|vicinae)$" } })
