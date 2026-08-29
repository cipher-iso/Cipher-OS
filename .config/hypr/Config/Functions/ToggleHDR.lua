--    ┏┳┓┏┓┏┓┏┓┓ ┏┓  ┓┏┳┓┳┓
--     ┃ ┃┃┃┓┃┓┃ ┣   ┣┫┃┃┣┫
--     ┻ ┗┛┗┛┗┛┗┛┗┛  ┛┗┻┛┛┗
hdr_state  = os.getenv("HOME") .. "/.config/hypr/Config/Shaders/.HDR-ON"
hdr_active = io.open(hdr_state, "r") ~= nil

local function is_crt_active()
    local f = io.open(shader_state, "r")
    if f then f:close(); return true end
    return false
end

local hdr_prev = {}

local function apply_hdr()
    hdr_prev = {
        cm       = hl.get_config("monitor.cm"),
        bitdepth = hl.get_config("monitor.bitdepth"),
    }
    io.open(hdr_state, "w"):close()
    hl.monitor({ output = "", cm = "hdr" })
    hl.notification.create({ text = "  [  HDR ENABLED  ]", timeout = 3000, icon = "hint", font_size = 20 })
end

local function restore_hdr()
    os.remove(hdr_state)
    if is_crt_active() then
        hl.monitor({ output = "", cm = "hdr" })
    else
        hl.monitor({ output = "", cm = hdr_prev.cm or "auto" })
    end
    hl.notification.create({ text = "  [  HDR DISABLED  ]", timeout = 3000, icon = "ok", font_size = 20 })
end

function ToggleHDR()
    hdr_active = not hdr_active
    if hdr_active then apply_hdr() else restore_hdr() end
end

if hdr_active then apply_hdr() end
