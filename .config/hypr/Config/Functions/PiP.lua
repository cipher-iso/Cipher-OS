--    ┏┓┳┏┓┏┳┓┳┳┳┓┏┓  ┳┳┓  ┏┓┳┏┓┏┳┓┳┳┳┓┏┓
--    ┃┃┃┃  ┃ ┃┃┣┫┣ ━━┃┃┃━━┃┃┃┃  ┃ ┃┃┣┫┣ 
--    ┣┛┻┗┛ ┻ ┗┛┛┗┗┛  ┻┛┗  ┣┛┻┗┛ ┻ ┗┛┛┗┗┛
function PiP()
    local active = hl.get_active_window()
    if active ~= nil and (
        string.match(active.title, "Picture in picture") or
        string.match(active.title, "Discord Popout") or
	string.match(active.class, "Update")
    ) then
        hl.dispatch(hl.dsp.window.drag())
    end
end
