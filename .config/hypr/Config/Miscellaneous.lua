--    ┳┳┓┳┏┓┏┓┏┓┓ ┓ ┏┓┳┓┏┓┏┓┳┳┏┓
--    ┃┃┃┃┗┓┃ ┣ ┃ ┃ ┣┫┃┃┣ ┃┃┃┃┗┓
--    ┛ ┗┻┗┛┗┛┗┛┗┛┗┛┛┗┛┗┗┛┗┛┗┛┗┛
hl.config({
    misc = {
        -- enable_anr_dialog = false,          	-- [ APP 'NOT-RESPONDING' DIALOG ]
        middle_click_paste = false,            	-- [ DISABLE MIDDLE-CLICK PASTE ]
        render_unfocused_fps = 240,            	-- [ UNFOCUSED WINDOW FPS ]
        force_default_wallpaper = 0,           	-- [ UN-FORCE WALLPAPERS ]
        background_color = "rgb(000000)",      	-- [ BLACK BACKGROUND ]
        disable_hyprland_logo = true,          	-- [ DISABLE HYPRLAND LOGO ]
	disable_splash_rendering = true,	-- [ DISABLE HYPRLAND SPLASH ]
        allow_session_lock_restore = true,	-- [ ALLOW LOCKSCREEN RESTORATION ]
    },
    debug = {
        -- disable_logs = false,        -- [ ALLOW DEBUGGING LOGS ]
        -- vfr = false,                 -- [ VARIABLE FRAME-RATE ]
        damage_tracking = 2,            -- [ 2 = DEFAULT | 0 = SHADERS ]
    },
    render = {
        direct_scanout = 2,		-- [ LOW-LATENCY // NO-VRR ]
	--use_fp16 = 0			-- [ COLOR ACCURACY ]
    },
    quirks = {
        -- prefer_hdr = 1,              -- [ HINT 'HDR' TO APPLICATIONS ]
    },
    xwayland = {
        force_zero_scaling = true,     	-- [ xWAYLAND SCALING ]
    },
    ecosystem = {
        no_donation_nag = true,         -- [ NO DONATION POP-UP ]
    },
    dwindle = {
        preserve_split = true,          -- [ PRESERVE SPLITS ]
    },
})

--    ┏┓┏┓┳┓┳┳┓┳┏┓┏┓┳┏┓┳┓┏┓
--    ┃┃┣ ┣┫┃┃┃┃┗┓┗┓┃┃┃┃┃┗┓
--    ┣┛┗┛┛┗┛ ┗┻┗┛┗┛┻┗┛┛┗┗┛
hl.permission("/usr/(bin|local/bin)/hyprpm", "plugin", "allow")
