--    ┳┓┏┓┓┏┳┏┓┏┓  ┳┳┓┏┓┳┳┏┳┓┏┓
--    ┃┃┣ ┃┃┃┃ ┣   ┃┃┃┃┃┃┃ ┃ ┗┓
--    ┻┛┗┛┗┛┻┗┛┗┛  ┻┛┗┣┛┗┛ ┻ ┗┛
hl.config({
    input = {
        sensitivity    = 0,                    -- SENSITIVITY
        accel_profile  = "flat",               -- ACCELERATION
        kb_options     = "fkeys:basic_13-24",  -- ENABLE KEYS | [F13-24]
        repeat_delay   = 400,                  -- DELAY BEFORE REPEAT [MS]
        mouse_refocus  = false,
    },
    cursor = {
        no_hardware_cursors = 1,
        no_break_fs_vrr     = 0,
        no_warps            = true,
    },
    binds = {
        allow_workspace_cycles = true,
        scroll_event_delay     = 5,
    },
})

--    ┓┏┓┏┓┓┏┳┓┳┳┓┳┓┏┓
--    ┣┫ ┣ ┗┫┣┫┃┃┃┃┃┗┓
--    ┛┗┛┗┛┗┛┻┛┻┛┗┻┛┗┛
-- [ WINDOW MANAGEMENT ]
hl.bind(MOD .. " + C",         hl.dsp.window.close())                                  -- Alt F4
hl.bind("ALT + F4",            hl.dsp.window.force_close())                            -- Alt F4
hl.bind(MOD .. " + V",         hl.dsp.window.float({ action = "toggle" }))             -- Toggle Floating [1]
hl.bind(MOD .. " + mouse:274", hl.dsp.window.float({ action = "toggle" }))             -- Toggle Floating [2]
hl.bind(MOD .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })               -- Move Window [KEYBOARD + MOUSE]
hl.bind(MOD .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })               -- Resize Window [KEYBOARD + MOUSE]
hl.bind("F19",                 hl.dsp.window.drag(),   { mouse = true })               -- Move Window [MOUSE-ONLY]
hl.bind("F20",                 hl.dsp.window.resize(), { mouse = true })               -- Resize Window [MOUSE-ONLY]
hl.bind(MOD .. " + Tab", function()                                                    -- Adjust Windows
    hl.dispatch(hl.dsp.layout("togglesplit"))                                          -- Split Windows
    hl.dispatch(hl.dsp.window.bring_to_top())                                          -- Bring Window to Top
    hl.dispatch(hl.dsp.layout("swapwithmaster master"))                                -- Swap Master Window
end)
hl.bind(MOD .. " + W",   hl.dsp.window.fullscreen({ internal = 1 }))                  -- Maximize Window
hl.bind(MOD .. " + F11", hl.dsp.window.fullscreen())                                  -- Fullscreen Window

-- [ GENERAL FUNCTIONS ]
hl.bind(MOD .. " + SHIFT + M", hl.dsp.exit())                                         -- End Session
hl.bind(MOD .. " + B",         hl.dsp.exec_cmd("hyprctl hyprsunset gamma 100"))       -- Set Brightness to Max

-- [ EXEC APPLICATIONS / TUI & GUI ]
hl.bind(MOD .. " + F",            hl.dsp.exec_cmd(Browser))                           -- Browser
hl.bind(MOD .. " + RETURN",       hl.dsp.exec_cmd(Menu))                              -- Application Menu
hl.bind(MOD .. " + E",            hl.dsp.exec_cmd(FileManager))                       -- File Manager
hl.bind(MOD .. " + SHIFT + Q",    hl.dsp.exec_cmd(Terminal))                          -- Terminal [TILED]
hl.bind(MOD .. " + Q",            hl.dsp.exec_cmd("[float; size 1400 800] " .. Terminal)) -- Terminal [FLOAT]
hl.bind("Control_L + Shift_L + Escape", hl.dsp.exec_cmd(Terminal .. " btop"))        -- Task Manager
hl.bind(MOD .. " + SHIFT + RETURN", hl.dsp.exec_cmd(Config))                         -- Open Config

-- [ CUSTOM SCRIPTS & FUNCTIONS ]
hl.bind(MOD .. " + F13",          hl.dsp.exec_cmd("Screenshot"))                      -- Screenshot [1]
hl.bind(MOD .. " + SHIFT + F13",  hl.dsp.exec_cmd("ScreenshotWindow"))                -- Screenshot [2] Active-Window
hl.bind(MOD .. " + D",            hl.dsp.exec_cmd("ShowDesktop"))                     -- Toggle Desktop
hl.bind(MOD .. " + I",            hl.dsp.exec_cmd("Hyprpicker"))                      -- Color Picker
hl.bind(MOD .. " + M",            hl.dsp.exec_cmd("Mute-Active-Window"))              -- Mute Active-Window
hl.bind(MOD .. " + SHIFT + L",    hl.dsp.exec_cmd("LockScreen"))                     -- Lockscreen
hl.bind(MOD .. " + grave",        hl.dsp.exec_cmd("ScreenShare toggle"))              -- Toggle Screen-Share
hl.bind(MOD .. " + T",            hl.dsp.exec_cmd("Waybar Toggle"))                   -- Toggle Waybar
hl.bind(MOD .. " + mouse:276",    hl.dsp.exec_cmd("Waybar Lock"))                     -- Lock Waybar [1] - [TOGGLE]
hl.bind(MOD .. " + SHIFT + 0",    hl.dsp.exec_cmd("ToggleCRT"))                       -- Toggle CRT Shader [HDR]
hl.bind(MOD .. " + SHIFT + Home", hl.dsp.exec_cmd("waypaper --random"))               -- Randomize Wallpaper
hl.bind(MOD .. " + R",            hl.dsp.exec_cmd("GenerateColors -d"))               -- Restore Default Colors
hl.bind(MOD .. " + SHIFT + R",    hl.dsp.exec_cmd("ReloadSystem"))                    -- Reload System

-- [ WORKSPACES ]
hl.bind(MOD .. " + mouse_down",  hl.dsp.workspace({ name = "e+1" }))
hl.bind(MOD .. " + mouse_up",    hl.dsp.workspace({ name = "e-1" }))
hl.bind(MOD .. " + mouse_right", hl.dsp.workspace({ name = "e+1" }))
hl.bind(MOD .. " + mouse_left",  hl.dsp.workspace({ name = "e-1" }))
hl.bind("ALT + TAB",             hl.dsp.workspace({ name = "e+1" }), { repeating = true })

-- [ SWITCH TO WORKSPACE 1-9 + SPECIAL ]
hl.bind(MOD .. " + 1", hl.dsp.workspace({ name = "1" }))
hl.bind(MOD .. " + 2", hl.dsp.workspace({ name = "2" }))
hl.bind(MOD .. " + 3", hl.dsp.workspace({ name = "3" }))
hl.bind(MOD .. " + 4", hl.dsp.workspace({ name = "4" }))
hl.bind(MOD .. " + 5", hl.dsp.workspace({ name = "5" }))
hl.bind(MOD .. " + 6", hl.dsp.workspace({ name = "6" }))
hl.bind(MOD .. " + 7", hl.dsp.workspace({ name = "7" }))
hl.bind(MOD .. " + 8", hl.dsp.workspace({ name = "8" }))
hl.bind(MOD .. " + 9", hl.dsp.workspace({ name = "9" }))
hl.bind(MOD .. " + S",          hl.dsp.workspace({ name = "special:magic" }))
hl.bind(MOD .. " + SHIFT + E",  hl.dsp.workspace({ name = "special:media" }))

-- [ MOVE TO WORKSPACE 1-9 + SPECIAL ]
hl.bind(MOD .. " + SHIFT + 1", hl.dsp.window.move_to_workspace({ workspace = "1" }))
hl.bind(MOD .. " + SHIFT + 2", hl.dsp.window.move_to_workspace({ workspace = "2" }))
hl.bind(MOD .. " + SHIFT + 3", hl.dsp.window.move_to_workspace({ workspace = "3" }))
hl.bind(MOD .. " + SHIFT + 4", hl.dsp.window.move_to_workspace({ workspace = "4" }))
hl.bind(MOD .. " + SHIFT + 5", hl.dsp.window.move_to_workspace({ workspace = "5" }))
hl.bind(MOD .. " + SHIFT + 6", hl.dsp.window.move_to_workspace({ workspace = "6" }))
hl.bind(MOD .. " + SHIFT + 7", hl.dsp.window.move_to_workspace({ workspace = "7" }))
hl.bind(MOD .. " + SHIFT + 8", hl.dsp.window.move_to_workspace({ workspace = "8" }))
hl.bind(MOD .. " + SHIFT + 9", hl.dsp.window.move_to_workspace({ workspace = "9" }))
hl.bind(MOD .. " + SHIFT + S",          hl.dsp.window.move_to_workspace({ workspace = "special:magic" }))
hl.bind(MOD .. " + SHIFT + mouse_down", hl.dsp.window.move_to_workspace({ workspace = "e+1" }))
hl.bind(MOD .. " + SHIFT + mouse_up",   hl.dsp.window.move_to_workspace({ workspace = "e-1" }))

-- [ MULTI-MEDIA KEYS - MOD-KEY ]
hl.bind(MOD .. " + F2", hl.dsp.exec_cmd("Gamma up"),                            { repeating = true }) -- INCREASE BRIGHTNESS
hl.bind(MOD .. " + F1", hl.dsp.exec_cmd("Gamma down"),                          { repeating = true }) -- DECREASE BRIGHTNESS
hl.bind(MOD .. " + F9", hl.dsp.exec_cmd("swayosd-client --playerctl next"),     { locked = true })    -- PLAY NEXT MEDIA
hl.bind(MOD .. " + F7", hl.dsp.exec_cmd("swayosd-client --playerctl previous"), { locked = true })    -- PLAY PREVIOUS MEDIA
hl.bind(MOD .. " + F8", hl.dsp.exec_cmd("swayosd-client --playerctl play-pause"), { locked = true })  -- PLAY/PAUSE MEDIA

-- [ MULTI-MEDIA KEYS - Fn KEYS ]
hl.bind("XF86AudioRaiseVolume",  hl.dsp.exec_cmd("swayosd-client --output-volume 5"),            { repeating = true, locked = true }) -- INCREASE VOLUME
hl.bind("XF86AudioLowerVolume",  hl.dsp.exec_cmd("swayosd-client --output-volume -5"),           { repeating = true, locked = true }) -- DECREASE VOLUME
hl.bind("XF86AudioMute",         hl.dsp.exec_cmd("swayosd-client --output-volume mute-toggle"),  { repeating = true, locked = true }) -- TOGGLE VOLUME
hl.bind("F15",                   hl.dsp.exec_cmd("swayosd-client --input-volume mute-toggle"),   { repeating = true, locked = true }) -- TOGGLE MICROPHONE
hl.bind("XF86AudioNext",         hl.dsp.exec_cmd("swayosd-client --playerctl next"),             { locked = true })                   -- PLAY NEXT MEDIA
hl.bind("XF86AudioPrev",         hl.dsp.exec_cmd("swayosd-client --playerctl previous"),         { locked = true })                   -- PLAY PREVIOUS MEDIA
hl.bind("XF86AudioPause",        hl.dsp.exec_cmd("swayosd-client --playerctl play-pause"),       { locked = true })                   -- PLAY/PAUSE MEDIA
hl.bind("XF86AudioPlay",         hl.dsp.exec_cmd("swayosd-client --playerctl play-pause"),       { locked = true })                   -- PLAY/PAUSE MEDIA
hl.bind("XF86MonBrightnessUp",   hl.dsp.exec_cmd("Gamma up"),                                    { repeating = true, locked = true }) -- INCREASE BRIGHTNESS
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("Gamma down"),                                  { repeating = true, locked = true }) -- DECREASE BRIGHTNESS

--    ┏┓┓ ┏┓┳┓┏┓┓   ┳┓┳┳┓┳┓┏┓
--    ┃┓┃ ┃┃┣┫┣┫┃   ┣┫┃┃┃┃┃┗┓
--    ┗┛┗┛┗┛┻┛┛┗┗┛  ┻┛┻┛┗┻┛┗┛

-- hl.bind("F15", hl.dsp.send_shortcut({ key = "F22", window = "class:discord|obs" }))

-- [ DISCORD PASSTHROUGH ]
hl.bind("F13", hl.dsp.pass({ window = "class:discord" }))  -- SCREEN-SHARE
hl.bind("F14", hl.dsp.pass({ window = "class:discord" }))  -- DEAFEN

-- [ OBS PASSTHROUGH ]
hl.bind(MOD .. " + equal",        hl.dsp.pass({ window = "class:obs" }))  -- BEGIN STREAM
hl.bind(MOD .. " + minus",        hl.dsp.pass({ window = "class:obs" }))  -- END STREAM
hl.bind(MOD .. " + bracketleft",  hl.dsp.pass({ window = "class:obs" }))  -- DISABLE PREVIEW
hl.bind(MOD .. " + bracketright", hl.dsp.pass({ window = "class:obs" }))  -- ENABLE PREVIEW
hl.bind(MOD .. " + backslash",    hl.dsp.pass({ window = "class:obs" }))  -- REPLAY BUFFER
