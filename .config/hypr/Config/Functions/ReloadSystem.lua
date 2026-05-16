--    ┳┓┏┓┓ ┏┓┏┓┳┓  ┏┓┓┏┏┓┏┳┓┏┓┳┳┓
--    ┣┫┣ ┃ ┃┃┣┫┃┃  ┗┓┗┫┗┓ ┃ ┣ ┃┃┃
--    ┛┗┗┛┗┛┗┛┛┗┻┛  ┗┛┗┛┗┛ ┻ ┗┛┛ ┗
function ReloadSystem()
-- [ PROCESSES TO KILL ]
    local kill = {
        "solaar",
        "vicinae",
        "hypridle",
        "hyprsunset",
    }
-- [ PROCESSES TO SPAWN ]
    local spawn = {
        "hypridle",
        "Waybar Reload",
        "vicinae server",
        "solaar -w hide",
        "hyprsunset -i",
    }
-- [ LOCAL PROCESSES ]
    local lines = {
        "hyprpm reload",
        "hyprctl reload",
        "GenerateColors",
        "hyprctl eval 'Screenshare_Restore()'",
        "killall " .. table.concat(kill, " ") .. " 2>/dev/null",
    }
    for _, p in ipairs(spawn) do lines[#lines + 1] = p .. " &" end
    hl.dispatch(hl.dsp.exec_cmd('bash -c "' .. table.concat(lines, "\n") .. '"'))
    hl.notification.create({ text = "  [ SYSTEM RELOADING ]", timeout = 3000, icon = "info", font_size = 16 })
end
