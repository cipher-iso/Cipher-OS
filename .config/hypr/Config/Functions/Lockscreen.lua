--    ┓ ┏┓┏┓┓┏┓┏┓┏┓┳┓┏┓┏┓┳┓
--    ┃ ┃┃┃ ┃┫ ┗┓┃ ┣┫┣ ┣ ┃┃
--    ┗┛┗┛┗┛┛┗┛┗┛┗┛┛┗┗┛┗┛┛┗
function Lockscreen()
-- [ PAUSE DISCORD ]
    hl.exec_cmd("killall -STOP Discord")

-- [ LOCK, THEN RESUME DISCORD WHEN UNLOCKED ]
    hl.exec_cmd("bash -c 'hyprlock && killall -CONT Discord'")
end
