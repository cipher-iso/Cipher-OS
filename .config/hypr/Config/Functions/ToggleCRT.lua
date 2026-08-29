--    ┏┓┳┓┏┳┓  ┏┓┓┏┏┓┳┓┏┓┳┓
--    ┃ ┣┫ ┃   ┗┓┣┫┣┫┃┃┣ ┣┫
--    ┗┛┛┗ ┻   ┗┛┛┗┛┗┻┛┗┛┛┗
shader_state  = os.getenv("HOME") .. "/.config/hypr/Config/Shaders/.Shader-ON"
shader_active = io.open(shader_state, "r") ~= nil

local function is_hdr_active()
    local f = io.open(hdr_state, "r")
    if f then f:close(); return true end
    return false
end

local crt_prev = {}

local function apply_crt()
    crt_prev = {
        damage_tracking = hl.get_config("debug.damage_tracking"),
        vfr             = hl.get_config("misc.vfr"),
        screen_shader   = hl.get_config("decoration.screen_shader"),
        cm              = hl.get_config("monitor.cm"),
    }
    io.open(shader_state, "w"):close()
    hl.config({ debug      = { damage_tracking = 0, vfr = false } })
    hl.config({ decoration = { screen_shader = os.getenv("HOME") .. "/.config/hypr/Config/Shaders/CRT" } })
    hl.monitor({ output = "", cm = "hdr" })
    hl.notification.create({ text = "  [  CRT ENABLED  ]",  timeout = 3000, icon = "hint", font_size = 20 })
end

local function restore_crt()
    os.remove(shader_state)
    hl.config({ debug      = { damage_tracking = crt_prev.damage_tracking, vfr = crt_prev.vfr } })
    hl.config({ decoration = { screen_shader   = crt_prev.screen_shader } })
    if is_hdr_active() then
        hl.monitor({ output = "", cm = "hdr" })
    else
        hl.monitor({ output = "", cm = crt_prev.cm or "auto" })
    end
    hl.notification.create({ text = "  [  CRT DISABLED  ]", timeout = 3000, icon = "ok", font_size = 20 })
end

function ToggleCRT()
    shader_active = not shader_active
    if shader_active then apply_crt() else restore_crt() end
end

if shader_active then apply_crt() end
