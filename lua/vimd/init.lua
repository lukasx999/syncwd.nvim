local M = {}


function M.setup(opts)
    opts = opts or {}
    print("hello from my plugin!")

    if opts.init == true then
        Enabled = true
    else
        Enabled = false
    end

end


-- API

function M.vimd_state()
    return Enabled
end

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
