# NVim Config Files

Current supported version of nVim is: 0.11

## Initial Setup
1. OS: default setup is Linux centric, with some manual steps for getting mac os to work
1. Create an `init.lua` in the config directory: `~/.config/nvim/init.lua` for your nVim setup. The file
   should contain `require("vim")`
1. Create a ./lua directory there and pull down this repo inside of that directory

## Install Tooling
- run `:checkahealth` and install needed deps
- install npm, node, and nvm
- install python
- install pip -> then pynvim can be installed if needed
- install Golang
- Install ripgrep (rg): https://github.com/BurntSushi/ripgrep
- Install languages as needed
- Install lua and lua rocks
  - nvim only supports lua 5.1. You need to install 5.1 first and lua rocks "should" install with
    that version
- Run `:Checkhealth` to ensure most items are ok. Fix areas which need fixing

### LSPs
- `mason` automates some of the configuration with LSPs. You will still need the tooling above and
  releated langauges

#### Java JPLS
- Requires special config and setup

#### Metals
- Requires special config TODO

## Additional Config
- If you have a GHE you can set an env var `GHE_URL` allowing `:GBrowse` to correctly work

# Dot Files
1. Make sure that `zsh` is instaled
2. Run the script in dotfiles `create_additional_config.sh` (this creates a stub function for any additional config)
3. Run `ln dotfiles/.zshrc ~/.zshrc`
4. tmux has os only config, you will need to uncomment/modify these in `bin/.tmux.conf`

# Installing and using zsh
1. Intall zsh
1. Install the `oh-my-zsh` plugin
