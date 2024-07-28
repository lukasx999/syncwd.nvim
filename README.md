
# vimd


## Sync your shells working directory with the one from Neovim



### Install

#### Neovim Plugin (via Lazy.nvim)

```lua

return { "lukasx999/vimd" }

```

#### Shell script



- Save the `changecwd.sh` script to somewhere on your system
- Add this line to your shellrc (`~/.bashrc`, `~/.zshrc`)

```bash

# ~/.bashrc

source path/to/changecwd.sh
# or: (source is a bashism)
. path/to/changecwd.sh

```



### Usage

- Start Vim
- Exit Vim



> NOTE: Whenever your cwd gets synced when exiting, you can always use `popd` to go back to the previous directory before the vim session



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
Then it will get the PID of its parent process (which is the shell that it was started from).
After that a signal, `SIGUSR1` (user defined signal) is sent to said pid.
The shell script, sourced in your `shellrc` then sets up a `trap` for said signal, which will then `pushd` into the cwd from `/tmp/vimd_cwd`.


