
local function vimd_state()
    return Enabled
end

local function vimd_enable()
    Enabled = true
end

local function vimd_disable()
    Enabled = false
end

local function vimd_toggle()
    Enabled = not Enabled
end
