
# Syncwd


## Sync Neovims working directory with the one of your shell


Normally when you start a Vim instance and navigate to another directory and exit Vim, you return to your shells CWD.<br>

If you'd like your shells working directory to be directly synced to Neovims working directory, then this plugin does just that.<br>
This plugin is very useful if your goal is to use a file manager such as `oil.nvim` as your primary file manager.<br>




### Install

#### Neovim Plugin (via Lazy.nvim)

```lua

return { "lukasx999/syncwd.nvim" }

```

#### Shell script


- Save the `changecwd.sh` script to somewhere on your system (eg: `~/Scripts/syncwd/changecwd.sh`)
- Add this line to your shellrc (`~/.bashrc`, `~/.zshrc`)

```bash

# ~/.bashrc

source path/to/changecwd.sh  # (source is a bashism)
# or:
. path/to/changecwd.sh

```

> **NOTE**: if syncwd is enabled within Neovim, but you have not configured your shell yet, your shell will exit after quitting vim!

<br>
<br>


### Usage

- Start Vim
- Exit Vim


> **NOTE**: Whenever your cwd gets synced when exiting, you can always use `popd` to go back to the previous directory before the vim session


### Configuration


```lua

return {
    "lukasx999/syncwd.nvim",
    config = function()

        require("syncwd").setup({
            init = true,  -- Should syncing be enabled on startup?
        })

    end,
}

```





### Commands

- `:SyncwdEnable`
- `:SyncwdDisable`
- `:SyncwdToggle`



### API


```lua
local syncwd = require("syncwd")
syncwd.state()
syncwd.enable()
syncwd.disable()
syncwd.toggle()
```



### How does this work???


Right before quitting Vim, a autocmd is fired, which will write the current working directory to a temporary file. (`/tmp/syncwd_cwd`)<br>
Then it will get the PID of its parent process. (which is the shell that it was started from)<br>
After that, a signal, `SIGUSR1` (user defined signal) is sent to said pid.<br>
The shell script, sourced in your `shellrc` then sets up a `trap` for said signal, which will then `pushd` into the cwd from `/tmp/syncwd_cwd`.<br>


