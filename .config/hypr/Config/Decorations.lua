--    ┳┓┏┓┏┓┏┓┳┓┏┓┏┳┓┳┏┓┳┓┏┓
--    ┃┃┣ ┃ ┃┃┣┫┣┫ ┃ ┃┃┃┃┃┗┓
--    ┻┛┗┛┗┛┗┛┛┗┛┗ ┻ ┻┗┛┛┗┗┛
-- [ GENERAL WINDOW BEHAVIOUR & BORDERS ]
hl.config({
    general = {
        gaps_in                  = 5,
        gaps_out                 = 10,
        border_size              = 2,
        resize_on_border         = true,
        extend_border_grab_area  = 15,
        col = {
	 ---@diagnostic disable: undefined-global
            inactive_border = "rgb(" .. BACKGROUND .. ")",
            active_border   = "rgb(" .. PRIMARY .. ")",
        },
        layout = "master",
        snap = {
            enabled       = true,
            respect_gaps  = true,
        },
    },

    -- [ MASTER-WINDOW SIZE ]
    master = {  mfact = 0.6,  },

    -- [ WINDOW DECORATIONS ]
    decoration = {
        rounding           = 0,
        rounding_power     = 2,
        active_opacity     = 0.9,
        inactive_opacity   = 0.85,
        fullscreen_opacity  = 1,
        dim_inactive       = false,
        dim_strength       = 0.5,
        dim_special        = 0.75,
        border_part_of_window = true,
        screen_shader      = os.getenv("HOME") .. "/.config/hypr/Shaders/Vibrance",
        blur = {
            enabled             = true,
            popups              = false,
            size                = 2,
            passes              = 4,
            vibrancy            = 1,
            vibrancy_darkness   = 1,
            contrast            = 10,
            brightness          = 1,
            popups_ignorealpha  = 0.6,
        },
        shadow = {
            enabled        = true,
            range          = 25,
            render_power   = 2,
            color          = "rgba(" .. PRIMARY    .. "02)",
            color_inactive = "rgba(" .. BACKGROUND .. "05)",
        },
	glow = {
		enabled 	= false,
		range 		= 25,
		render_power 	= 2,
		color		= "rgba(" .. PRIMARY .. "20)",
	},
    },
})

--    ┏┓┳┓┳┳┳┓┏┓┏┳┓┳┏┓┳┓┏┓
--    ┣┫┃┃┃┃┃┃┣┫ ┃ ┃┃┃┃┃┗┓
--    ┛┗┛┗┻┛ ┗┛┗ ┻ ┻┗┛┛┗┗┛
-- [ ANIMATION VALUES ]
hl.curve("linear",  { type = "bezier", points = { {0,    0   }, {1,    1    } } })
hl.curve("bounce",  { type = "bezier", points = { {0.28, 0.61}, {0.58, 1.26 } } })
hl.curve("boing",   { type = "bezier", points = { {0.48, 0.51}, {0.35, 1.3  } } })
hl.curve("spring",  { type = "spring", mass = 1.5, stiffness = 100, dampening = 12 })
hl.curve("wsBounce",{ type = "spring", mass = 2.5, stiffness = 100, dampening = 22 })

-- [ ANIMATION SETTINGS ]
hl.animation({ leaf = "global",         enabled = true, speed = 3, bezier = "boing"                           })
hl.animation({ leaf = "border",         enabled = true, speed = 1, bezier = "linear"                          })
hl.animation({ leaf = "fade",           enabled = true,	speed = 1, bezier = "bounce"                          })
hl.animation({ leaf = "fadeOut", 	enabled = true, speed = 1, bezier = "boing" })
hl.animation({ leaf = "workspaces", 	enabled = true, speed = 1, spring = "wsBounce", style = "slidevert -100%" })
hl.animation({ leaf = "windows",        enabled = true, speed = 2, spring = "spring",  	style = "popin 15%"    })
hl.animation({ leaf = "windowsOut",	enabled = true, speed = 1, bezier = "boing",	style = "popin 15%" })
hl.animation({ leaf = "specialWorkspace", enabled = true, speed = 2, spring = "spring", style = "slidevert"    })
