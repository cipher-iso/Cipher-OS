function AltTab(direction)
    local all        = hl.get_workspaces()
    local workspaces = {}

    -- Keep only non-special, non-empty workspaces
    for _, ws in ipairs(all) do
        if not ws.special and ws.windows > 0 then
            workspaces[#workspaces + 1] = ws
        end
    end

    if #workspaces == 0 then return end

    -- Sort by workspace ID so cycling goes 1→2→3 etc.
    table.sort(workspaces, function(a, b)
        return a.id < b.id
    end)

    local active = hl.get_active_workspace()
    local cur_id = active and active.id or -1
    local idx    = 1

    for i, ws in ipairs(workspaces) do
        if ws.id == cur_id then
            idx = i
            break
        end
    end

    local next_idx = ((idx - 1 + direction) % #workspaces) + 1
    hl.dispatch(hl.dsp.focus({ workspace = tostring(workspaces[next_idx].id) }))
end
