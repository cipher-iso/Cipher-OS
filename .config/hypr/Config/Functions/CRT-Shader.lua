--    ┏┓┳┓┏┳┓  ┏┓┓┏┏┓┳┓┏┓┳┓
--    ┃ ┣┫ ┃ ━━┗┓┣┫┣┫┃┃┣ ┣┫
--    ┗┛┛┗ ┻   ┗┛┛┗┛┗┻┛┗┛┛┗
shader_state  = os.getenv("HOME") .. "/.config/hypr/Shaders/.Shader-ON"
shader_active = io.open(shader_state, "r") ~= nil

local crt_prev = {}

function ToggleCRT()
    shader_active = not shader_active
    if shader_active then
        -- [ SNAPSHOT PREVIOUS VALUES ]
        crt_prev = {
            damage_tracking = hl.get_config("debug.damage_tracking"),
            vfr             = hl.get_config("misc.vfr"),
            screen_shader   = hl.get_config("decoration.screen_shader"),
            use_fp16        = hl.get_config("render.use_fp16"),
    	}
        -- [ ENABLE CRT ]
        io.open(shader_state, "w"):close()
        hl.config({ debug      = { damage_tracking = 0, vfr = false } })
        hl.config({ decoration = { screen_shader = os.getenv("HOME") .. "/.config/hypr/Shaders/CRT" } })
        hl.monitor({ output = "", cm = "hdr", bitdepth = 10 })
        hl.config({ render     = { use_fp16 = 0 } })
        hl.notification.create({ text = "  [  CRT ENABLED  ]",  timeout = 3000, icon = "hint", font_size = 16 })
    else
        -- [ RESTORE PREVIOUS VALUES ]
        os.remove(shader_state)
        hl.config({ debug      = { damage_tracking = crt_prev.damage_tracking, vfr = crt_prev.vfr } })
        hl.config({ decoration = { screen_shader   = crt_prev.screen_shader } })
        hl.monitor({ output = "", cm = "auto", bitdepth = 8 })
        hl.config({ render     = { use_fp16 = crt_prev.use_fp16 } })
        hl.notification.create({ text = "  [  CRT DISABLED  ]", timeout = 3000, icon = "ok", font_size = 16 })
    end
end
