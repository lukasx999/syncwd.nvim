

local vimd = require("vimd")

vim.api.nvim_create_user_command(
    "VimdEnable",
    function()
        vimd.vimd_enable()
    end,
    { bang = false, nargs = "*", complete = "shellcmd" }
)

vim.api.nvim_create_user_command(
    "VimdDisable",
    function()
        vimd.vimd_disable()
    end,
    { bang = false, nargs = "*", complete = "shellcmd" }
)

vim.api.nvim_create_user_command(
    "VimdToggle",
    function()
        vimd.vimd_toggle()
    end,
    { bang = false, nargs = "*", complete = "shellcmd" }
)
