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
hl.bind(MOD .. " + C",         hl.dsp.window.close())                		-- Alt F4
hl.bind("ALT + F4",            hl.dsp.window.kill())                            -- Alt F4 [FORCE-KILL]
hl.bind(MOD .. " + V",         hl.dsp.window.float({ action = "toggle" }))      -- Toggle Floating [1]
hl.bind(MOD .. " + mouse:274", hl.dsp.window.float({ action = "toggle" }))      -- Toggle Floating [2]
hl.bind(MOD .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })        -- Move Window [KEYBOARD + MOUSE]
hl.bind(MOD .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })        -- Resize Window [KEYBOARD + MOUSE]
hl.bind("F19",                 hl.dsp.window.drag(),   { mouse = true })        -- Move Window [MOUSE-ONLY]
hl.bind("F20",                 hl.dsp.window.resize(), { mouse = true })        -- Resize Window [MOUSE-ONLY]
hl.bind(MOD .. " + Tab",       hl.dsp.layout("swapwithmaster master"))  	-- Swap Master Window
hl.bind(MOD .. " + W",         hl.dsp.window.fullscreen({ mode = 1 }))   	-- Maximize Window
hl.bind(MOD .. " + F11",       hl.dsp.window.fullscreen())               	-- Fullscreen Window

-- [ GENERAL KEYBINDINGS ]
hl.bind(MOD .. " + SHIFT + M", hl.dsp.exit())   			-- End Session
hl.bind(MOD .. " + B", hl.dsp.exec_cmd("hyprctl hyprsunset gamma 100"))	-- Set Brightness to 100%

-- [ APP LAUNCHERS ]
hl.bind(MOD .. " + F",              hl.dsp.exec_cmd(Browser))                   -- Browser
hl.bind(MOD .. " + RETURN",         hl.dsp.exec_cmd(Menu))                      -- Application Menu
hl.bind(MOD .. " + E",              hl.dsp.exec_cmd(FileManager))               -- File Manager
hl.bind(MOD .. " + SHIFT + Q",      hl.dsp.exec_cmd(Terminal))                  -- Terminal [TILED]
hl.bind(MOD .. " + Q", hl.dsp.exec_cmd("[float; size 1400 800] " .. Terminal))	-- Terminal [FLOAT]
hl.bind("CTRL + SHIFT + Escape",    hl.dsp.exec_cmd(Terminal .. " btop"))   	-- Task Manager
hl.bind(MOD .. " + SHIFT + RETURN", hl.dsp.exec_cmd(Config))                    -- Open Config

-- [ CUSTOM FUNCTIONS ]
hl.bind(MOD .. " + + Prior", 	function() ToggleCRT() end)	-- Toggle CRT Shader
hl.bind(MOD .. " + + Next", 	function() ToggleHDR() end)	-- Toggle HDR
hl.bind(MOD .. " + SHIFT + L", 	function() Lockscreen() end)	-- Lockscreen
hl.bind(MOD .. " + M", 		function() MuteActive() end)	-- Mute Active-Window
hl.bind(MOD .. " + I", 		function() ThemePicker() end)	-- Theme Switcher
hl.bind(MOD .. " + grave", 	function() Screenshare() end)	-- Toggle Screensharing
hl.bind(MOD .. " + SHIFT + R", 	function() ReloadSystem() end)	-- Reload System
hl.bind(MOD .. " + F13",   	function() CaptureRegion() end)	-- Screenshot Region
hl.bind(MOD .. " + SHIFT + F13",function() CaptureWindow() end)	-- Screenshot Window
hl.bind("mouse:273", function() PiP() end, { mouse = true, non_consuming = true })

-- [ CUSTOM SCRIPTS ]
hl.bind(MOD .. " + T",            hl.dsp.exec_cmd("Waybar Toggle"))     -- Toggle Waybar
hl.bind(MOD .. " + mouse:276",    hl.dsp.exec_cmd("Waybar Lock"))       -- Lock Waybar
hl.bind(MOD .. " + SHIFT + Home", hl.dsp.exec_cmd("waypaper --random")) -- Randomize Wallpaper
hl.bind(MOD .. " + R",            hl.dsp.exec_cmd("GenerateColors -d")) -- Restore Default Colors

-- [ WORKSPACES ]
hl.bind(MOD .. " + mouse_down",  function() Workspace_Up() end)
hl.bind(MOD .. " + mouse_up",    function() Workspace_Down() end)
hl.bind(MOD .. " + mouse_right", function() Workspace_Up() end)
hl.bind(MOD .. " + mouse_left",  function() Workspace_Down() end)
hl.bind("ALT + TAB", function() hl.plugin.hyprexpo.expo("toggle") end)
--hl.bind("ALT + TAB", function() AltTab(1)  end, { repeating = true })
--hl.bind("ALT + SHIFT + TAB", function() AltTab(-1)  end, { repeating = true })

-- [ SWITCH TO WORKSPACE 1-9 + SPECIAL ]
hl.bind(MOD .. " + 1", hl.dsp.focus({ workspace = 1 }))
hl.bind(MOD .. " + 2", hl.dsp.focus({ workspace = 2 }))
hl.bind(MOD .. " + 3", hl.dsp.focus({ workspace = 3 }))
hl.bind(MOD .. " + 4", hl.dsp.focus({ workspace = 4 }))
hl.bind(MOD .. " + 5", hl.dsp.focus({ workspace = 5 }))
hl.bind(MOD .. " + 6", hl.dsp.focus({ workspace = 6 }))
hl.bind(MOD .. " + 7", hl.dsp.focus({ workspace = 7 }))
hl.bind(MOD .. " + 8", hl.dsp.focus({ workspace = 8 }))
hl.bind(MOD .. " + 9", hl.dsp.focus({ workspace = 9 }))
hl.bind(MOD .. " + S",         hl.dsp.workspace.toggle_special("magic"))
hl.bind(MOD .. " + SHIFT + E", hl.dsp.workspace.toggle_special("media"))

-- [ MOVE TO WORKSPACE 1-9 + SPECIAL ]
hl.bind(MOD .. " + SHIFT + 1", hl.dsp.window.move({ workspace = 1 }))
hl.bind(MOD .. " + SHIFT + 2", hl.dsp.window.move({ workspace = 2 }))
hl.bind(MOD .. " + SHIFT + 3", hl.dsp.window.move({ workspace = 3 }))
hl.bind(MOD .. " + SHIFT + 4", hl.dsp.window.move({ workspace = 4 }))
hl.bind(MOD .. " + SHIFT + 5", hl.dsp.window.move({ workspace = 5 }))
hl.bind(MOD .. " + SHIFT + 6", hl.dsp.window.move({ workspace = 6 }))
hl.bind(MOD .. " + SHIFT + 7", hl.dsp.window.move({ workspace = 7 }))
hl.bind(MOD .. " + SHIFT + 8", hl.dsp.window.move({ workspace = 8 }))
hl.bind(MOD .. " + SHIFT + 9", hl.dsp.window.move({ workspace = 9 }))
hl.bind(MOD .. " + SHIFT + S", function() ToggleSpecial() end)
hl.bind(MOD .. " + SHIFT + mouse_down", function() Window_Down() end)
hl.bind(MOD .. " + SHIFT + mouse_up",   function() Window_Up() end)

-- [ MULTI-MEDIA KEYS - MOD-KEY ]
hl.bind(MOD .. " + F2", hl.dsp.exec_cmd("Gamma up"),                              { repeating = true }) -- INCREASE BRIGHTNESS
hl.bind(MOD .. " + F1", hl.dsp.exec_cmd("Gamma down"),                            { repeating = true }) -- DECREASE BRIGHTNESS
hl.bind(MOD .. " + F9", hl.dsp.exec_cmd("swayosd-client --playerctl next"),       { locked = true })    -- PLAY NEXT MEDIA
hl.bind(MOD .. " + F7", hl.dsp.exec_cmd("swayosd-client --playerctl previous"),   { locked = true })    -- PLAY PREVIOUS MEDIA
hl.bind(MOD .. " + F8", hl.dsp.exec_cmd("swayosd-client --playerctl play-pause"), { locked = true })    -- PLAY/PAUSE MEDIA

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
-- [ DISCORD PASSTHROUGH ]
hl.bind("F13", hl.dsp.pass({ window = "class:discord" }))  -- SCREEN-SHARE
hl.bind("F13", hl.dsp.pass({ window = "class:discord" }), { release = true })
hl.bind("F14", hl.dsp.pass({ window = "class:discord" }))  -- DEAFEN
hl.bind("F14", hl.dsp.pass({ window = "class:discord" }), { release = true })

-- [ OBS PASSTHROUGH ]
hl.bind(MOD .. " + equal",        hl.dsp.pass({ window = "class:obs" }))  -- BEGIN STREAM
hl.bind(MOD .. " + equal",        hl.dsp.pass({ window = "class:obs" }), { release = true })
hl.bind(MOD .. " + minus",        hl.dsp.pass({ window = "class:obs" }))  -- END STREAM
hl.bind(MOD .. " + minus",        hl.dsp.pass({ window = "class:obs" }), { release = true })
hl.bind(MOD .. " + bracketleft",  hl.dsp.pass({ window = "class:obs" }))  -- DISABLE PREVIEW
hl.bind(MOD .. " + bracketleft",  hl.dsp.pass({ window = "class:obs" }), { release = true })
hl.bind(MOD .. " + bracketright", hl.dsp.pass({ window = "class:obs" }))  -- ENABLE PREVIEW
hl.bind(MOD .. " + bracketright", hl.dsp.pass({ window = "class:obs" }), { release = true })
hl.bind(MOD .. " + backslash",    hl.dsp.pass({ window = "class:obs" }))  -- REPLAY BUFFER
hl.bind(MOD .. " + backslash",    hl.dsp.pass({ window = "class:obs" }), { release = true })
