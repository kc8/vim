# Neovim Configuration Dotfiles and Other Tools

Current supported version of neovim is: 0.11

## Initial Setup: Configs
1. install zsh
  - [here](https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH)
1. install `oh-my-zsh` plugin
  - `sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"`
1. download stable version of neovim [here](https://github.com/neovim/neovim/releases)
1. clone this repo into `$HOME/.config/nvim`
1. run the following to place configs in directories:
    - `dotfiles/setup-dot-files`
    - `dotfiles/build_tmux_config.sh`
    - `dotfiles/create_additional_config.sh`
          - allows more sensetive configs or additional 'use case' configs as `.zshrc` will source this first

## Install Tooling for Neovim
- run `:checkhealth` and install needed dependencies
- install: npm, node, and nvm
- install: python
- install: pip -> then pynvim can be installed if needed
- install: golang
- install: ripgrep (rg): https://github.com/BurntSushi/ripgrep
- languages as needed
- lua and luarocks
  - nvim only supports lua 5.1
- run `:checkhealth` again

## LSPs
- `mason` automates some of the configuration with LSPs. You will still need the tooling above and
  related languages installed

## Additional Config
- if you have a GHE you can set an environment var `GHE_URL` allowing `:GBrowse` to correctly work (you can set this in `additional_config.sh`

## Other Tools
- a list/ shell script that is a WIP: see [tools_install.sh](./tools_install.sh)

## Slop Tooling:
- no slop generators in the editor/configs I can generate plenty of slop on my own
- install OpenCode
