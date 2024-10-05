# NVim Config Files

Current supported version of nVim is: 0.10

## Initial Setup (working on Linux/Unix)

1. Create an init.lua (or init.vim) insider of the config directory (~/.config/nvim/[xxxx]) for your VIM setup
1. Create a ./lua directory there and pull down this repo inside of that directory
1. Inside the init.lua that you created earlier, require("vim") and everything should start to function -> or if using .vimrc, source the .vimrc file as needed)
1. Install [Packer](https://github.com/wbthomason/packer.nvim)
1. After installing packer, you should be able to restart the nvim session and run `:packer install`

## Using LUA
Inside the config path for VIM you will need to create something c 'lua', for example lua/vim. VIM will look inside the lua for namespaces. So your init.lua file will look like

Add the following to your init.lua file you created earlier
```sh
require("vim")
```
which will tell vim to look inside the lua directory and then look for the vim (or this repo)

## Installing Tooling
- run `:checkahealth` and install needed deps
- install: `npm`/`node`
- install: python
- install: pip -> then pynvim can be installed if needed

- You will need ripgrep (rg): https://github.com/BurntSushi/ripgrep

### LSPs
** Changing to `mason` automates some of the configuration with LSPs
These need to be installed seperatley and added to the path so nvim lsp can use them
There are some docs inside the lsp config files on how to get started
- You may need to add these to your path

## Additonal Config
- If you have a GHE you can set an env var `GHE_URL` to allow `:GBrowse` to correctly work

# Dot Files

To setup dot files, do the following:

1. Make sure that `zsh` is instaled
2. Run the script in dotfiles `create_additional_config.sh` (this creates a stub function for any additional config)
3. Run `ln dotfiles/.zshrc ~/.zshrc`

