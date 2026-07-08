--    ┏┳┓┏┓┏┓┏┓┓ ┏┓  ┏┓┏┓┏┓┏┓┳┏┓┓ 
--     ┃ ┃┃┃┓┃┓┃ ┣   ┗┓┃┃┣ ┃ ┃┣┫┃ 
--     ┻ ┗┛┗┛┗┛┗┛┗┛  ┗┛┣┛┗┛┗┛┻┛┗┗┛
function ToggleSpecial()
    local win = hl.get_active_window()
    if win == nil then return end
    if win.workspace.name == "special:magic" then
        hl.dispatch(hl.dsp.window.move({ workspace = win.monitor.active_workspace.id, silent = true }))
    else
        hl.dispatch(hl.dsp.window.move({ workspace = "special:magic", silent = true }))
    end
end
