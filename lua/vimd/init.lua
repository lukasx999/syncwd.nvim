local M = {}


function M.setup(opts)
    opts = opts or {}

    if opts.init == true then
        Enabled = true
    else
        Enabled = false
    end

end



local api = require("api.lua")
M.vimd_state = api.vimd_state
M.vimd_enable = api.vimd_enable
M.vimd_disable = api.vimd_disable
M.vimd_toggle = api.vimd_toggle


return M
