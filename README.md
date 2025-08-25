# NVim Config Files

Current supported version of nVim is: 0.11

## Initial Setup
1. OS: default setup is Linux centric, with some manual steps for getting mac os to work
1. create an `init.lua` in the config directory: `~/.config/nvim/init.lua` for your nVim setup. The file
   should contain `require("vim")`
1. create a ./lua directory there and pull down this repo inside of that directory

## Install Tooling
- run `:checkahealth` and install needed deps
- install npm, node, and nvm
- install python
- install pip -> then pynvim can be installed if needed
- install Golang
- Install ripgrep (rg): https://github.com/BurntSushi/ripgrep
- install languages as needed
- install lua and lua rocks
  - nvim only supports lua 5.1. You need to install 5.1 first and lua rocks "should" install with
    that version
- run `:Checkhealth` to ensure most items are ok. Fix areas which need fixing

### LSPs
- `mason` automates some of the configuration with LSPs. You will still need the tooling above and
  releated langauges installed

## Additional Config
- If you have a GHE you can set an env var `GHE_URL` allowing `:GBrowse` to correctly work

# Dot Files
1. make sure that `zsh` is instaled
2. run the script in dotfiles `create_additional_config.sh` (this creates a stub function for any additional config)
3. run `ln dotfiles/.zshrc ~/.zshrc`
4. tmux has os only config, you will need to uncomment/modify these in `bin/.tmux.conf`

# Installing and using zsh
1. intall zsh
1. install the `oh-my-zsh` plugin

# Ghostty Term settings
Add the following to the config file
- Turn off ligatures: `font-feature=-calt,-lig,dlig`
