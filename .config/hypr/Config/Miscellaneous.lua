--    ┳┳┓┳┏┓┏┓┏┓┓ ┓ ┏┓┳┓┏┓┏┓┳┳┏┓
--    ┃┃┃┃┗┓┃ ┣ ┃ ┃ ┣┫┃┃┣ ┃┃┃┃┗┓
--    ┛ ┗┻┗┛┗┛┗┛┗┛┗┛┛┗┛┗┗┛┗┛┗┛┗┛
hl.config({
    misc = {
        -- session_lock_xray = true,           -- [ RENDER THROUGH LOCKSCREEN ]
        -- enable_anr_dialog = false,          -- [ APP 'NOT-RESPONDING' DIALOG ]
        middle_click_paste = false,            -- [ DISABLE MIDDLE-CLICK PASTE ]
        render_unfocused_fps = 240,            -- [ FPS FOR UNFOCUSED APPLICATIONS ]
        force_default_wallpaper = 0,           -- [ NO FORCED WALLPAPERS ]
        background_color = "rgb(000000)",      -- [ OLED-BLACK BACKGROUND ]
        disable_hyprland_logo = true,          -- [ DISABLE HYPRLAND SPLASH ]
        allow_session_lock_restore = true,
    },
    render = {
        direct_scanout = 2,                    -- [ LOW-LATENCY // NO-VRR ]
    },
    quirks = {
        -- prefer_hdr = 1,                     -- [ HINT 'HDR' TO APPLICATIONS ]
    },
    xwayland = {
        force_zero_scaling = true,             -- [ xWAYLAND SCALING ]
    },
    ecosystem = {
        no_donation_nag = true,                -- [ NO DONATION POP-UP ]
    },
    dwindle = {
        preserve_split = true,                 -- [ PRESERVE SPLITS ]
    },
    debug = {
        -- disable_logs = false,               -- [ ALLOW DEBUGGING LOGS ]
        -- vfr = false,                        -- [ MOVED HERE FROM misc: IN 0.55 ]
        damage_tracking = 2,                   -- [ 2 = DEFAULT | 0 = SHADERS ]
    },
})

--    ┏┓┏┓┳┓┳┳┓┳┏┓┏┓┳┏┓┳┓┏┓
--    ┃┃┣ ┣┫┃┃┃┃┗┓┗┓┃┃┃┃┃┗┓
--    ┣┛┗┛┛┗┛ ┗┻┗┛┗┛┻┗┛┛┗┗┛
hl.permission("/usr/(bin|local/bin)/hyprpm", "plugin", "allow")
