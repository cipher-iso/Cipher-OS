--    ┳┓┳┏┓┏┓┓ ┏┓┓┏  ┏┓┏┓┏┳┓┏┳┓┳┳┓┏┓┏┓
--    ┃┃┃┗┓┃┃┃ ┣┫┗┫  ┗┓┣  ┃  ┃ ┃┃┃┃┓┗┓
--    ┻┛┻┗┛┣┛┗┛┛┗┗┛  ┗┛┗┛ ┻  ┻ ┻┛┗┗┛┗┛
hl.monitor({
    output              = "",
    vrr                 = 3,
    cm                  = "auto",
    scale               = 1,
    position            = "0x0",
    mode                = "preferred",
    supports_hdr        = 1,
    min_luminance       = 0,
    max_luminance       = 1000,
    sdr_min_luminance   = 0,
    sdr_max_luminance   = 400,
    supports_wide_color = 1,
})

--    ┏┓┏┓┳┳┳┓┏┓┏┓┳┓  ┏┓┏┓┳┓┏┓┳┏┓
--    ┗┓┃┃┃┃┣┫┃ ┣ ┃┃  ┃ ┃┃┃┃┣ ┃┃┓
--    ┗┛┗┛┗┛┛┗┗┛┗┛┻┛  ┗┛┗┛┛┗┻ ┻┗┛
require("Config.Identifiers")   -- 	┏ IDENTIFIED VARIABLES
require("Config.Auto-Start")    -- 	┣ AUTOMATIC STARTUPS
require("Config.Environment")   -- 	┣ ENVIRONMENT VARIABLES
require("Config.Decorations")   -- 	┣ DECORATIONS & ANIMATIONS
require("Config.Input")         -- 	┣ INPUT & KEYBINDS
require("Config.Window-Rules")  -- 	┣ WINDOW & LAYER RULES
require("Config.Miscellaneous") -- 	┗ EXPERIMENTAL SETTINGS

--     ┏┓┳┳┳┓┏┓┏┳┓┳┏┓┳┓┏┓
--     ┣ ┃┃┃┃┃  ┃ ┃┃┃┃┃┗┓
--     ┻ ┗┛┛┗┗┛ ┻ ┻┗┛┛┗┗┛
require("Config.Functions.Screenshare")	--	┏ TOGGLE SCREENSHARING
require("Config.Functions.CRT-Shader")	--	┣ TOGGLE CRT SHADER
require("Config.Functions.ReloadSystem")--	┣ RELOAD SYSTEM
require("Config.Functions.Mute-Window")	--	┗ MUTE ACTIVE-WINDOW
