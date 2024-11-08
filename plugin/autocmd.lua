


-- Get parent process id from given pid
local function ppidof(pid)
    local cmd = string.format("ps -o ppid= -p %s", pid)
    local handle = io.popen(cmd)
    if handle == nil then return end
    local ppid = handle:read("*a")
    handle:close()
    local fmt = ppid:gsub('[\n\r]', ' ')  -- Get rid of newline
    return fmt
end


-- When quitting Vim, write the current CWD to a file and send SIGUSR1 to the parent process (shell that vim was started from)

vim.api.nvim_create_augroup("syncwd", { clear = true })
vim.api.nvim_create_autocmd(
    "VimLeave",
    {
        pattern = "",
        group = "syncwd",
        callback = function()

            if Enabled == false then return end

            local cwd = vim.fn.getcwd()

            -- Write current CWD to file
            local file = io.open("/tmp/syncwd_cwd", "w")
            if file == nil then return end
            file:write(cwd)
            file:close()

            local pid = vim.fn.getpid()

            -- Get PID of current nvim instance
            local pid_vim = ppidof(pid)
            -- Get PID of parent shell process
            local parent_pid = ppidof(pid_vim)

            -- Send signal
            local cmd = string.format("kill -USR1 %s", parent_pid)
            os.execute(cmd)


        end,
    }
)
