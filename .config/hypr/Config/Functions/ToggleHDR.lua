--    ┏┳┓┏┓┏┓┏┓┓ ┏┓  ┓┏┳┓┳┓
--     ┃ ┃┃┃┓┃┓┃ ┣   ┣┫┃┃┣┫
--     ┻ ┗┛┗┛┗┛┗┛┗┛  ┛┗┻┛┛┗
hdr_state  = os.getenv("HOME") .. "/.config/hypr/Shaders/.HDR-ON"
hdr_active = io.open(hdr_state, "r") ~= nil
local hdr_prev = {}

local function apply_hdr()
    hdr_prev = {
        cm       = hl.get_config("monitor.cm"),
        bitdepth = hl.get_config("monitor.bitdepth"),
        use_fp16 = hl.get_config("render.use_fp16"),
    }
    io.open(hdr_state, "w"):close()
    hl.monitor({ output = "", cm = "hdr", bitdepth =10 })
    hl.config({ render = { use_shader_blur_blend = true, use_fp16 = true } })
    hl.notification.create({ text = "  [  HDR ENABLED  ]", timeout = 3000, icon = "hint", font_size = 16 })
end

local function restore_hdr()
    os.remove(hdr_state)
    hl.monitor({ output = "", cm = hdr_prev.cm or "auto", bitdepth = hdr_prev.bitdepth or 8 })
    hl.config({ render = { use_shader_blur_blend = false, use_fp16 = hdr_prev.use_fp16 } })
    hl.notification.create({ text = "  [  HDR DISABLED  ]", timeout = 3000, icon = "ok", font_size = 16 })
end

function ToggleHDR()
    hdr_active = not hdr_active
    if hdr_active then apply_hdr() else restore_hdr() end
end

if hdr_active    then apply_hdr() end
