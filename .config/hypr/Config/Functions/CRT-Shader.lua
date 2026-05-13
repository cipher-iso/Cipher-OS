--    ┏┓┳┓┏┳┓  ┏┓┓┏┏┓┳┓┏┓┳┓
--    ┃ ┣┫ ┃ ━━┗┓┣┫┣┫┃┃┣ ┣┫
--    ┗┛┛┗ ┻   ┗┛┛┗┛┗┻┛┗┛┛┗
shader_state  = os.getenv("HOME") .. "/.config/hypr/Shaders/.Shader-ON"
shader_active = io.open(shader_state, "r") ~= nil

function ToggleCRT()
    shader_active = not shader_active
    if shader_active then
        -- [ ENABLE CRT ]
        io.open(shader_state, "w"):close()
        hl.config({ debug      = { damage_tracking = 0, vfr = false } })
        hl.config({ decoration = { screen_shader = os.getenv("HOME") .. "/.config/hypr/Shaders/CRT" } })
        hl.monitor({ output = "", cm = "hdr", bitdepth = 10 })
        hl.config({ render     = { use_fp16 = 0 } })
        hl.notification.create({ text = "  [  CRT ENABLED  ]",  timeout = 3000, icon = "hint", font_size = 16 })
    else
        -- [ DISABLE CRT ]
        os.remove(shader_state)
        hl.config({ debug      = { damage_tracking = 2, vfr = true } })
        hl.config({ decoration = { screen_shader = os.getenv("HOME") .. "/.config/hypr/Shaders/Vibrance" } })
        hl.monitor({ output = "", cm = "auto", bitdepth = 8 })
        hl.config({ render     = { use_fp16 = 1 } })
        hl.notification.create({ text = "  [  CRT DISABLED  ]", timeout = 3000, icon = "ok",   font_size = 16 })
    end
end
