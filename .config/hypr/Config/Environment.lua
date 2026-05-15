--    ┏┓┳┓┓┏┳┳┓┏┓┳┓┳┳┓┏┓┳┓┏┳┓  ┓┏┏┓┳┓┳┏┓┳┓┓ ┏┓┏┓
--    ┣ ┃┃┃┃┃┣┫┃┃┃┃┃┃┃┣ ┃┃ ┃   ┃┃┣┫┣┫┃┣┫┣┫┃ ┣ ┗┓
--    ┗┛┛┗┗┛┻┛┗┗┛┛┗┛ ┗┗┛┛┗ ┻   ┗┛┛┗┛┗┻┛┗┻┛┗┛┗┛┗┛
-- ADD PATHS 		[ QUICK-USE SCRIPTS ]
hl.env("PATH", (os.getenv("HOME") or "") .. "/Scripts:" .. (os.getenv("PATH") or ""))

-- FIX AUDIO ISSUES 	[ STUTTER & CUT-OUTS ]
hl.env("PULSE_LATENCY_MSEC", "60")

-- CURSOR SETTINGS 	[ THEME & SIZE ]
hl.env("XCURSOR_SIZE",                "24")
hl.env("HYPRCURSOR_SIZE",             "24")
hl.env("XCURSOR_THEME",               "Bibata-Modern-Ice")
hl.env("HYPRCURSOR_THEME",            "Bibata-Modern-Ice")

-- THEME SETTINGS 	[ GTK & QT ]
hl.env("GTK_THEME",                           "matrix")
hl.env("QT_QPA_PLATFORMTHEME",                "qt6ct")
hl.env("QT_QPA_PLATFORM",                     "wayland;xcb")
hl.env("QT_AUTO_SCREEN_SCALE_FACTOR",         "1")
hl.env("QT_WAYLAND_DISABLE_WINDOWDECORATION", "1")

-- MENU SETTINGS 	[ HYPRLAND-SPECIFIC ]
hl.env("XDG_MENU_PREFIX",      "arch-")
hl.env("XDG_SESSION_TYPE",     "wayland")
hl.env("XDG_CURRENT_DESKTOP",  "Hyprland")
hl.env("XDG_SESSION_DESKTOP",  "Hyprland")

-- NVIDIA SETTINGS 	[ PERFORMANCE & OPTIMIZATIONS ]
local handle = io.popen("lspci 2>/dev/null | grep -i nvidia")
if handle then
    local result = handle:read("*a")
    handle:close()
    if result ~= nil and result ~= "" then
        hl.env("NVD_BACKEND",                  "direct")
        hl.env("LIBVA_DRIVER_NAME",            "nvidia")
        hl.env("__GLX_VENDOR_LIBRARY_NAME",    "nvidia")
        hl.env("ELECTRON_OZONE_PLATFORM_HINT", "auto")
        hl.env("WLR_NO_HARDWARE_CURSORS",      "1")
    end
end
