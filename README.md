# Neovim Configuration and Tools

Current supported version of neovim is: 0.11

## Initial Setup
1. install zsh
  - [here](https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH)
1. install the `oh-my-zsh` plugin
  - `sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"`
1. download a stable version of neovim [here](https://github.com/neovim/neovim/releases)
1. clone this repo into `$HOME/.config/nvim`
1. run `bin/setup-dev-env` to automate some setup

## Install Tooling for Neovim
- run `:checkhealth` and install needed dependencies
- npm, node, and nvm
- python
- pip -> then pynvim can be installed if needed
- golang
- ripgrep (rg): https://github.com/BurntSushi/ripgrep
- languages as needed
- lua and luarocks
  - nvim only supports lua 5.1.
- run `:checkhealth` again

### LSPs
- `mason` automates some of the configuration with LSPs. You will still need the tooling above and
  related languages installed

## Additional Config
- If you have a GHE you can set an environment var `GHE_URL` allowing `:GBrowse` to correctly work
- You can run the `dotfiles/create_additional_config.sh` script and then add the GHE_URL in there

## Dot Files
1. ensure `zsh` is installed
1. run the script in `./dotfiles/create_additional_config.sh`
  - this creates a stub script you can add additional configuration to such as environment variables)
1. `ln dotfiles/.zshrc ~/.zshrc`
  - NOTE: use `additional_config.sh` to make changes to .zshrc that should not be reflected in GitHub
1. tmux has os only config, you will need to uncomment/modify these in `dotfiles/.tmux.conf`

## Other Tools
- A list/ shell script that is a WIP: see [tools_install.sh](./tools_install.sh)

### Ghostty Term settings
Add the following to the config file
- Turn off ligatures: `font-feature=-calt,-lig,dlig`
