--    ┓ ┏┳┳┓┳┓┏┓┓ ┏  ┳┓┳┳┓ ┏┓┏┓
--    ┃┃┃┃┃┃┃┃┃┃┃┃┃━━┣┫┃┃┃ ┣ ┗┓
--    ┗┻┛┻┛┗┻┛┗┛┗┻┛  ┛┗┗┛┗┛┗┛┗┛
-- [ DEFINED WORKSPACES ]
hl.window_rule({ workspace = "1", focus_on_activate = true, 	  match = { class = "vivaldi-stable|mpv" }})
hl.window_rule({ workspace = "2 silent",  			  match = { class = "discord" }})
hl.window_rule({ workspace = "3 silent",  			  match = { class = "steam", title = "^(Steam|Sign in to Steam)$" }})
hl.window_rule({ workspace = "5 silent", render_unfocused = true, match = { class = "obs" }})
hl.window_rule({ workspace = "6", opaque = true, 	  	  match = { class = "resolve" }})
hl.window_rule({ workspace = "9", opaque = true, 	  	  match = { title = "^.*(Prism|Minecraft).*$" }})

--    ┏┓┏┓┏┳┓┏┓┏┓┏┓┳┓┳┏┓┏┓
--    ┃ ┣┫ ┃ ┣ ┃┓┃┃┣┫┃┣ ┗┓
--    ┗┛┛┗ ┻ ┗┛┗┛┗┛┛┗┻┗┛┗┛
hl.window_rule({	-- [ HIDDEN WINDOWS ]
	name = "SCREENSHARE",
	no_screen_share = true,
	match = { class = "^(discord|vivaldi-stable|steam)$" }
})
hl.window_rule({	-- [ AUDIO MANAGEMENT ]
	name 	= "MEDIA",
	workspace = "special:media silent",
	match 	= { class = "^(.*easyeffects)$" }
})
hl.window_rule({	--  [ GAMES & LAUNCHERS ]
	name             = "GAMES",
	content          = "game",
	workspace        = "9",
	idle_inhibit     = "always",
	opaque           = true,
	no_dim           = true,
	no_anim          = true,
	no_blur          = true,
	decorate         = false,
	no_shadow        = true,
	fullscreen  	 = true,
	render_unfocused = true,
	center		 = true,
	tag = "+hyprglass_disabled",
	match = { initial_class = "^.*(steam_app_|cs2|RimWorldLinux|osu!|Sober|gamescope).*$" }
})
hl.window_rule({	-- [ FLOATS - NO FORCED SIZING ]
	name    = "FLOAT ONLY",
	float   = true,
	center  = true,
	max_size = "monitor_w*0.75 monitor_h*0.7",
	match 	= { title = "^.*(Vivaldi Settings|OBS Studio Crash Detected|1659040).*$" }
})
hl.window_rule({	-- [ SMALL FLOATS ]
	name   	= "FLOAT SMALL",
	float  	= true,
	center 	= true,
	size   	= "monitor_w*0.2 monitor_h*0.35",
	match 	= { class = "^(blueman-manager|com.network.manager|.*pupgui2|.*share-picker|solaar)$" }
})
hl.window_rule({	-- [ MEDIUM FLOATS ]
	name   	= "FLOAT MEDIUM",
	float  	= true,
	center 	= true,
	size   	= "monitor_w*0.45 monitor_h*0.5",
	match 	= { class = "^.*(pavucontrol-qt|lsfg-vk|xdg-|Update|org.kde.ark|easyeffects).*$" }
})
hl.window_rule({	-- [ LARGE FLOATS ]
	name   	= "FLOAT LARGE",
	float  	= true,
	center 	= true,
	size   	= "monitor_w*0.5 monitor_h*0.58",
	match 	= { class = "^(.*dolphin.*|qimgv|mpv|timeshift-gtk)$" }
})

--    ┓ ┏┏┓┳┓┓┏┓┏┓┏┓┏┓┏┓┏┓  ┳┓┳┳┓ ┏┓┏┓
--    ┃┃┃┃┃┣┫┃┫ ┗┓┃┃┣┫┃ ┣ ━━┣┫┃┃┃ ┣ ┗┓
--    ┗┻┛┗┛┛┗┛┗┛┗┛┣┛┛┗┗┛┗┛  ┛┗┗┛┗┛┗┛┗┛
-- [ PERSISTENT WORKSPACES 1-9 ]
for i = 1, 9 do
    hl.workspace_rule({ workspace = tostring(i), persistent = true })
end

-- [ FULLSCREEN WINDOWS WHEN ONLY 1 ]
hl.workspace_rule({ workspace = "w[tv1]s[false]", gaps_out = 0, gaps_in = 0 })
hl.workspace_rule({ workspace = "f[1]s[false]",   gaps_out = 0, gaps_in = 0 })

hl.window_rule({
	name 		= "WORKSPACES",
	opaque  	= true,
	decorate	= false,
	match = { float = false, workspace = "w[tv1]s[false]" }
})

--    ┏┓┳┳┏┓┓ ┳┏┳┓┓┏  ┏┓┏┓  ┓ ┳┏┓┏┓
--    ┃┃┃┃┣┫┃ ┃ ┃ ┗┫━━┃┃┣ ━━┃ ┃┣ ┣ 
--    ┗┻┗┛┛┗┗┛┻ ┻ ┗┛  ┗┛┻   ┗┛┻┻ ┗┛
-- [ HYPRLAND 'FIXES' ]
hl.window_rule({ min_size = "500 250", match = { class = "kitty" } })
hl.window_rule({ suppress_event = "maximize", match = { class = ".*" } })
hl.window_rule({ no_vrr = true, idle_inhibit = "focus", match = { content = "video" } })
hl.window_rule({ allows_input = true, no_blur = true, opaque = true, no_focus = true, match = { class = "^$", title = "^$", xwayland = 1, float = 1, fullscreen = 0, pin = 0 } })

-- [ STEAM SUB-WINDOWS ]
hl.window_rule({ opaque = true, no_blur = true, match = { class = "steam", title = "^$", } })
hl.window_rule({ opacity = 0, no_focus = true, no_blur = true, match = { title = "^(.*AntiCheat.*)$" } })
hl.window_rule({ center = true, match = { class = "steam", title = "negative:^()$|^(Steam Settings)$" } })
hl.window_rule({ min_size = "1 1", pin = true, opaque = true, no_dim = true, match = { title = "^(.*notificationtoasts.*)$" } })
hl.window_rule({ no_dim = true, focus_on_activate = true, float = true, match = { class = "steam", initial_title = "negative:Steam" } })

-- [ FIX STEAM 'BIG-PICTURE' MODE ]
hl.on("window.active", function(w)
  if w.class == "steam" and w.title == "Steam Big Picture Mode" then
    hl.dispatch(hl.dsp.window.fullscreen({ action = "set", mode = "fullscreen" }))
  end
end)

-- [ DOLPHIN SUB-WINDOWS ]
hl.window_rule({ min_size = "1 1", match = { title = "^.*(Copying —|Folder —|Exists —|Dialog —).*$" }, center = true, size = "monitor_w*0.25 monitor_h*0.15" })

-- [ PICTURE-IN-PICTURE ]
hl.window_rule({ float = true, size = "900 450", pin = true, move = "(12) (978)", no_dim = true, match = { class = "Update" } })
hl.window_rule({ float = true, opaque = true, size = "640 360", pin = true, move = "(1908) (1068)", no_dim = true, no_initial_focus = true, match = { title = "^(Picture in picture|Discord Popout)$" } })

-- [ CUSTOM FLOATS ]
hl.window_rule({ workspace = "9 silent", float = true, center = true, match = { class = ".*exe" } })
hl.window_rule({ float = true, center = true, size = "780 980", max_size = "780 980", min_size = "780 980", match = { class = "waypaper" } })

--    ┓ ┏┓┓┏┏┓┳┓  ┳┓┳┳┓ ┏┓┏┓
--    ┃ ┣┫┗┫┣ ┣┫━━┣┫┃┃┃ ┣ ┗┓
--    ┗┛┛┗┗┛┗┛┛┗  ┛┗┗┛┗┛┗┛┗┛
hl.layer_rule({ no_anim = true, match = { namespace = "selection" } })
hl.layer_rule({ blur = true, blur_popups = true, ignore_alpha = 0, match = { namespace = "^(waybar|swaync-notification-window|swayosd|vicinae)$" } })
