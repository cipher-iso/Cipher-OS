---@diagnostic disable: undefined-global
-- ┏┓┳┳┳┓┏┓┏┳┓┳┏┓┳┓┏┓
-- ┣ ┃┃┃┃┃  ┃ ┃┃┃┃┃┗┓
-- ┻ ┗┛┛┗┗┛ ┻ ┻┗┛┛┗┗┛
-- [ SCREENSHARE TOGGLE ]
local screenshare_state = os.getenv("HOME") .. "/Scripts/.Screenshare-ON"
local screenshare_active = io.open(screenshare_state, "r") ~= nil

hl.bind(MOD .. " + grave", function()
    screenshare_active = not screenshare_active
    if screenshare_active then
        -- [ SESSION EXPOSED ]
        io.open(screenshare_state, "w"):close()
        hl.window_rule({ name = "SCREENSHARE", no_screen_share = false, match = { class = "^(discord|vivaldi-stable|steam)$" } })
        hl.window_rule({ name = "WORKSPACES",  opaque = true, decorate = true,  rounding = 0, match = { float = false, workspace = "w[tv1]s[false]" } })
        hl.config({ decoration = { shadow = { color = "rgba(" .. SECONDARY .. "02)" } } })
        hl.config({ general  = { ["col.active_border"] = "rgb(" .. SECONDARY .. ")" } })
        hl.notification.create({ text = "[ SESSION EXPOSED ]",   timeout = 3000, icon = "warning", font_size = 16 })
    else
        -- [ SESSION INCOGNITO ]
        os.remove(screenshare_state)
        hl.window_rule({ name = "SCREENSHARE", no_screen_share = true,  match = { class = "^(discord|vivaldi-stable|steam)$" } })
        hl.window_rule({ name = "WORKSPACES",  opaque = true, decorate = false, rounding = 0, match = { float = false, workspace = "w[tv1]s[false]" } })
        hl.config({ decoration = { shadow = { color = "rgba(" .. PRIMARY .. "02)" } } })
        hl.config({ general  = { ["col.active_border"] = "rgb(" .. PRIMARY .. ")" } })
        hl.notification.create({ text = "[ SESSION INCOGNITO ]", timeout = 3000, icon = "ok", font_size = 16 })
    end
end)

-- [ CRT SHADER TOGGLE ]
local shader_state = os.getenv("HOME") .. "/.config/hypr/Shaders/.Shader-ON"
local shader_active = io.open(shader_state, "r") ~= nil

hl.bind(MOD .. " + SHIFT + 0", function()  -- change to whatever bind you want
    shader_active = not shader_active
    if shader_active then
        -- [ ENABLE CRT ]
        io.open(shader_state, "w"):close()
        hl.config({ debug = { damage_tracking = 0, vfr = false } })
        hl.config({ decoration = { screen_shader = os.getenv("HOME") .. "/.config/hypr/Shaders/CRT" } })
	hl.monitor({ output = "", cm = "hdr", bitdepth = 10 })
	hl.config({ render = { use_fp16 = 0 }})
        hl.notification.create({ text = "[ CRT ENABLED ]", timeout = 3000, icon = "hint", font_size = 16 })
    else
        -- [ DISABLE CRT ]
        os.remove(shader_state)
        hl.config({ debug = { damage_tracking = 2, vfr = true } })
        hl.config({ decoration = { screen_shader = os.getenv("HOME") .. "/.config/hypr/Shaders/Vibrance" } })
	hl.monitor({ output = "", cm = "auto", bitdepth = 8 })
	hl.config({ render = { use_fp16 = 1 }})
        hl.notification.create({ text = "[ CRT DISABLED ]", timeout = 3000, icon = "ok", font_size = 16 })
    end
end)
