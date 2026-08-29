--    ┳┓┏┓┏┓┏┓┳┓┏┓┏┳┓┳┏┓┳┓┏┓
--    ┃┃┣ ┃ ┃┃┣┫┣┫ ┃ ┃┃┃┃┃┗┓
--    ┻┛┗┛┗┛┗┛┛┗┛┗ ┻ ┻┗┛┛┗┗┛
-- [ GENERAL WINDOW BEHAVIOUR & BORDERS ]
hl.config({
    general = {
        gaps_in                  = 10,
        gaps_out                 = 20,
        border_size              = 2,
        resize_on_border         = true,
        extend_border_grab_area  = 15,
        col = {
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
        fullscreen_opacity = 1,
        dim_inactive       = false,
        dim_strength       = 0.5,
        dim_special        = 0.75,
        border_part_of_window = true,
        --screen_shader      = os.getenv("HOME") .. "/.config/hypr/Config/Shaders/Vibrance",
        blur = {
            enabled             = true,
            popups              = false,
            size                = 2,
            passes              = 4,
            vibrancy            = 0.75,
            vibrancy_darkness   = 0.15,
            contrast            = 10,
            brightness          = 1.25,
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
	    enabled 	   = true,
	    range 	   = 25,
	    render_power   = 2,
	    color	   = "rgba(" .. PRIMARY .. "30)",
	    color_inactive = "rgba(00000000)",
	},
	motion_blur = {
	    enabled = true,
	    samples = 10,
	},
    },
})

--    ┏┓┳┓┳┳┳┓┏┓┏┳┓┳┏┓┳┓┏┓
--    ┣┫┃┃┃┃┃┃┣┫ ┃ ┃┃┃┃┃┗┓
--    ┛┗┛┗┻┛ ┗┛┗ ┻ ┻┗┛┛┗┗┛
-- [ ANIMATION VALUES ]
hl.curve("Linear", { type = "bezier", points = {{ 0 , 0 }, { 1 , 1 }}})
hl.curve("Jimbo",  { type = "spring", mass = 1.5,  stiffness = 1250, dampening = 60 })
hl.curve("Jelly",  { type = "spring", mass = 1.5,  stiffness = 1500, dampening = 40 })
hl.curve("Jello",  { type = "spring", mass = 2.25, stiffness = 1500, dampening = 75 })
hl.curve("Jiggle", { type = "spring", mass = 2,    stiffness = 1500, dampening = 70 })

-- [ ANIMATION SETTINGS ]
hl.animation({ leaf = "global",           enabled = true, speed = 0.75, bezier = "Linear"  })
hl.animation({ leaf = "border",           enabled = true, speed = 0.75, bezier = "Linear" })
hl.animation({ leaf = "fade",             enabled = true, speed = 0.75, bezier = "Linear" })
hl.animation({ leaf = "fadeOut", 	  enabled = true, speed = 0.75, bezier = "Linear" })
hl.animation({ leaf = "workspaces", 	  enabled = true, speed = 1, spring = "Jello", 	style = "slidevert -100%" })
hl.animation({ leaf = "windows",          enabled = true, speed = 1, spring = "Jimbo", })
hl.animation({ leaf = "windowsIn",        enabled = true, speed = 1, spring = "Jelly",	style = "popin 15%"    	  })
hl.animation({ leaf = "specialWorkspace", enabled = true, speed = 1, spring = "Jiggle",	style = "slidevert"    	  })
