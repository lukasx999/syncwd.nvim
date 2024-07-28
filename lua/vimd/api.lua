
local Api = {}

function Api.vimd_state()
    return Enabled
end

function Api.vimd_enable()
    Enabled = true
end

function Api.vimd_disable()
    Enabled = false
end

function Api.vimd_toggle()
    Enabled = not Enabled
end

return Api
