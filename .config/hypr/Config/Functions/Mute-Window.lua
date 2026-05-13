--    ┳┳┓┳┳┏┳┓┏┓  ┏┓┏┓┏┳┓┳┓┏┏┓  ┓ ┏┳┳┓┳┓┏┓┓ ┏
--    ┃┃┃┃┃ ┃ ┣   ┣┫┃  ┃ ┃┃┃┣ ━━┃┃┃┃┃┃┃┃┃┃┃┃┃
--    ┛ ┗┗┛ ┻ ┗┛  ┛┗┗┛ ┻ ┻┗┛┗┛  ┗┻┛┻┛┗┻┛┗┛┗┻┛
function MuteActive()
    local w = hl.get_active_window()
    if w ~= nil then
        hl.exec_cmd("wpctl set-mute -p " .. w.pid .. " toggle")
        hl.notification.create({ text = "  [  Muted - " .. w.initial_title .. "  ]", timeout = 3000, icon = "ok", font_size = 16 })
    else
        hl.notification.create({ text = "  [  NO CLIENT FOUND!  ]", timeout = 3000, icon = "error", font_size = 16 })
    end
end
