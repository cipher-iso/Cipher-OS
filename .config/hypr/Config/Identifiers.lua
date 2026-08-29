--    ┳┳┓┏┓┳┓┏┳┓┳┏┓┳┏┓┳┓  ┓┏┏┓┳┓┳┏┓┳┓┓ ┏┓┏┓
--    ┃┃┃┣ ┃┃ ┃ ┃┣ ┃┣ ┃┃  ┃┃┣┫┣┫┃┣┫┣┫┃ ┣ ┗┓
--    ┻┻┛┗┛┛┗ ┻ ┻┻ ┻┗┛┻┛  ┗┛┛┗┛┗┻┛┗┻┛┗┛┗┛┗┛
-- [ APPLICATIONS | MODIFIERS ]
MOD          = "SUPER"			-- 'SUPER' key
Terminal     = "kitty"			-- Terminal
Browser      = "vivaldi"		-- Browser
FileManager  = "dolphin"		-- File Manager
Menu         = "vicinae toggle"		-- Application Launcher

-- [ APPLICATIONS | FLAGS & VARIABLES ]
Sunshine     = "PULSE_LATENCY_MSEC=0 sunshine"
OBS          = "com.obsproject.Studio --startreplaybuffer"
Discord      = "XDG_SESSION_TYPE=x11 discord"
EasyEffects  = "QT_QPA_PLATFORMTHEME=gtk3 easyeffects"

-- [ GENERAL ENVIRONMENT ]
Polkit       = "/usr/lib/mate-polkit/polkit-mate-authentication-agent-1"
Config       = "[float;size 1800 1000] " .. Terminal .. " nvim ~/.config/hypr/hyprland.lua"
XDPH         = "dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
Listener     = "~/Scripts/ColorGen/Listener"

-- [ PRIMARY COLORS ]
PRIMARY      = "00FF40"
SECONDARY    = "EBFAFA"
BACKGROUND   = "000000"

-- [ SECONDARY COLORS ]
ACCENT1      = "323449"
ACCENT2      = "212337"
ACCENT3      = "10111C"
