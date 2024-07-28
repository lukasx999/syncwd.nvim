
# vimd


## Sync your shells working directory with the one from Neovim



### Install (via Lazy.nvim)


```lua

return { "lukasx999/vimd" }

```



### Configuration


```lua

return {
    "lukasx999/vimd",
    config = function()

        require("vimd").setup({
            init = true,  -- Should vimd be enabled on startup?
        })

    end,
}

```


> **NOTE**: if vimd is enabled within Neovim, but you have not configured your shell yet, your shell will crash!



### Commands

- :VimdEnable
- :VimdDisable
- :VimdToggle



### API


```lua
local vimd = require("vimd")
vimd.state()
vimd.enable()
vimd.disable()
vimd.toggle()
```



### How does this work???


Right before quitting Vim, a autocmd is fired, which will write the current working directory to a temporary file. (`/tmp/vimd_cwd`)
Then it will get the PID of its parent process (which is the shell that it was started from)
After that a signal, `SIGUSR1` (user defined signal) is sent to said pid.
The shell script, sourced in your `shellrc` then sets up a `trap` for said signal, which will then `pushd` into the cwd from `/tmp/vimd_cwd`.


