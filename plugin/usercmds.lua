

local syncwd = require("syncwd")

vim.api.nvim_create_user_command(
    "SyncwdEnable",
    function()
        syncwd.enable()
    end,
    { bang = false, nargs = "*", complete = "shellcmd" }
)

vim.api.nvim_create_user_command(
    "SyncwdDisable",
    function()
        syncwd.disable()
    end,
    { bang = false, nargs = "*", complete = "shellcmd" }
)

vim.api.nvim_create_user_command(
    "SyncwdToggle",
    function()
        syncwd.toggle()
    end,
    { bang = false, nargs = "*", complete = "shellcmd" }
)
