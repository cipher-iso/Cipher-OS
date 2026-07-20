--    ┳┓┳┏┓┏┓┓ ┏┓┓┏  ┏┓┏┓┏┳┓┏┳┓┳┳┓┏┓┏┓
--    ┃┃┃┗┓┃┃┃ ┣┫┗┫  ┗┓┣  ┃  ┃ ┃┃┃┃┓┗┓
--    ┻┛┻┗┛┣┛┗┛┛┗┗┛  ┗┛┗┛ ┻  ┻ ┻┛┗┗┛┗┛
hl.monitor({
--  [ GENERAL SETTINGS ]
    output      	= "",
    position    	= "0x0",
    cm          	= "auto",
    mode        	= "preferred",
    vrr         	= 3,
    scale		= 1,
--  [ HDR SETTINGS ]
    supports_hdr        = 1,
    supports_wide_color = 1,
    sdr_min_luminance   = 0,
    min_luminance       = 0,
    sdr_max_luminance   = 400,
    max_luminance       = 1000
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
require("Config.Functions.PiP")			--	┏ PiP DRAGGING
require("Config.Functions.AltTab")		--	┣ ALT+TAB BEHAVIOUR
require("Config.Functions.ToggleHDR")		--	┣ TOGGLE HDR
require("Config.Functions.ToggleCRT")		--	┣ TOGGLE CRT SHADER
require("Config.Functions.Screenshot")		--	┣ SCREENSHOT UTILITY
require("Config.Functions.Lockscreen")		--	┣ SLEEP DISCORD + LOCK
require("Config.Functions.Mute-Window")		--	┣ MUTE ACTIVE-WINDOW
require("Config.Functions.Screenshare")		--	┣ TOGGLE SCREENSHARING
require("Config.Functions.ReloadSystem")	--	┣ RELOAD SYSTEM
require("Config.Functions.Theme-Picker")	--	┣ THEME SWITCHER
require("Config.Functions.ToggleSpecial")	--	┣ TOGGLE SPECIAL WORKSPACES
require("Config.Functions.DiscordInhibitor")	--	┣ DISCORD IDLE-INHIBITOR
require("Config.Functions.WorkspaceClamping")	--	┗ CLAMP WORKSPACE 1-9

--    ┏┓┓ ┳┳┏┓┳┳┓┏┓
--    ┃┃┃ ┃┃┃┓┃┃┃┗┓
--    ┣┛┗┛┗┛┗┛┻┛┗┗┛
--require("Config.Plugins.Hyprexpo")
