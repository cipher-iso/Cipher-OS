--    ┳┓┏┓┓ ┏┓┏┓┳┓  ┏┓┓┏┏┓┏┳┓┏┓┳┳┓
--    ┣┫┣ ┃ ┃┃┣┫┃┃  ┗┓┗┫┗┓ ┃ ┣ ┃┃┃
--    ┛┗┗┛┗┛┗┛┛┗┻┛  ┗┛┗┛┗┛ ┻ ┗┛┛ ┗
--    [ MOD + SHIFT + R ]
function ReloadSystem()
    hl.dispatch(hl.dsp.exec_cmd([[bash -c "
        hyprpm reload
        hyprctl reload
        hyprctl eval 'Screenshare_Restore()'
        GenerateColors
        killall hyprsunset hypridle solaar vicinae 2>/dev/null
        hyprctl hyprsunset gamma \$(cat /tmp/current_gamma)
        Waybar Reload &
        hyprsunset -i --gamma_max 200 &
        hypridle &
        vicinae server &
        solaar -w hide &
    "]]))
    hl.notification.create({ text = "  [ SYSTEM RELOADING ]", timeout = 3000, icon = "info", font_size = 16 })
end
