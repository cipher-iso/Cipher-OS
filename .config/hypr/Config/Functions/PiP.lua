--    ┏┓┳┏┓┏┳┓┳┳┳┓┏┓  ┳┳┓  ┏┓┳┏┓┏┳┓┳┳┳┓┏┓
--    ┃┃┃┃  ┃ ┃┃┣┫┣ ━━┃┃┃━━┃┃┃┃  ┃ ┃┃┣┫┣ 
--    ┣┛┻┗┛ ┻ ┗┛┛┗┗┛  ┻┛┗  ┣┛┻┗┛ ┻ ┗┛┛┗┗┛
function PiP()
    local active = hl.get_active_window()
    if active ~= nil and (
        active.pinned
    ) then
        hl.dispatch(hl.dsp.window.drag())
    end
end
