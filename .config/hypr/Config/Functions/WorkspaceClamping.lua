--    ┓ ┏┏┓┳┓┓┏┓┏┓┏┓┏┓┏┓┏┓  ┏┓┓ ┏┓┳┳┓┏┓┳┳┓┏┓
--    ┃┃┃┃┃┣┫┃┫ ┗┓┃┃┣┫┃ ┣ ━━┃ ┃ ┣┫┃┃┃┃┃┃┃┃┃┓
--    ┗┻┛┗┛┛┗┛┗┛┗┛┣┛┛┗┗┛┗┛  ┗┛┗┛┛┗┛ ┗┣┛┻┛┗┗┛
local WORKSPACE_MIN = 1
local WORKSPACE_MAX = 9

function Workspace_Up()
    local ws = hl.get_active_workspace()
    if ws ~= nil and ws.id < WORKSPACE_MAX then
        hl.dispatch(hl.dsp.focus({ workspace = tostring(ws.id + 1) }))
    end
end

function Workspace_Down()
    local ws = hl.get_active_workspace()
    if ws ~= nil and ws.id > WORKSPACE_MIN then
        hl.dispatch(hl.dsp.focus({ workspace = tostring(ws.id - 1) }))
    end
end
