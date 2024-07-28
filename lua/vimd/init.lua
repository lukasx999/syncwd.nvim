local M = {}


function M.setup(opts)

    opts = opts or {}

    if opts.init == true then
        Enabled = true
    else
        Enabled = false
    end

end



function M.state()
    return Enabled
end

function M.enable()
    Enabled = true
end

function M.disable()
    Enabled = false
end

function M.toggle()
    Enabled = not Enabled
end



return M
