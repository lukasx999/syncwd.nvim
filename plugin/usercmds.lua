

local vimd = require("vimd")

vim.api.nvim_create_user_command(
    "VimdEnable",
    function()
        vimd.enable()
    end,
    { bang = false, nargs = "*", complete = "shellcmd" }
)

vim.api.nvim_create_user_command(
    "VimdDisable",
    function()
        vimd.disable()
    end,
    { bang = false, nargs = "*", complete = "shellcmd" }
)

vim.api.nvim_create_user_command(
    "VimdToggle",
    function()
        vimd.toggle()
    end,
    { bang = false, nargs = "*", complete = "shellcmd" }
)
