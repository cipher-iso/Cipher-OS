--    ┳┓┳┏┓┏┓┏┓┳┓┳┓  ┳┳┓┓┏┳┳┓┳┏┳┓┏┓┳┓
--    ┃┃┃┗┓┃ ┃┃┣┫┃┃━━┃┃┃┣┫┃┣┫┃ ┃ ┃┃┣┫
--    ┻┛┻┗┛┗┛┗┛┛┗┻┛  ┻┛┗┛┗┻┻┛┻ ┻ ┗┛┛┗
local discord_inhibit_active = false
function DiscordInhibitor()
    -- pactl list sink-inputs short prints one line per active audio stream.
    -- We grep for "discord" (case-insensitive) to detect active VC/audio.
    local handle = io.popen("pactl list sink-inputs 2>/dev/null | grep -i discord")
    local result = handle:read("*a")
    handle:close()

    local discord_is_active = (result ~= nil and result ~= "")

    if discord_is_active and not discord_inhibit_active then
        -- Spawn a systemd-inhibit process and store its PID for later release.
        -- Uses the 'idle' inhibitor type so hypridle / DPMS is suppressed.
        os.execute("systemd-inhibit --what=idle --who=Hyprland --why='Discord Voice Active' --mode=block sleep infinity &")
        discord_inhibit_active = true
        hl.notification.create({
            text    = "Discord voice detected — idle inhibit enabled.",
            timeout = 3000,
            icon    = "ok"
        })

    elseif not discord_is_active and discord_inhibit_active then
        -- Release the inhibitor by killing the sleep process.
        os.execute("pkill -f 'systemd-inhibit.*Discord Voice Active'")
        discord_inhibit_active = false
        hl.notification.create({
            text    = "Discord voice ended — idle inhibit released.",
            timeout = 3000,
            icon    = "ok"
        })
    end
end
