local M = {}


function M.setup()
    print("hello from my plugin!")
end


-- API

function M.vimd_enable()
    Enabled = true
end

function M.vimd_disable()
    Enabled = false
end

function M.vimd_toggle()
    Enabled = not Enabled
end


return M
