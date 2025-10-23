# Scripts for terminal

### Prerequisites
- zsh is default
- tmux is installed
- fzf is installed
- tmux requirements are met (see below)
- see other tools in ../README.md

## Tmux Config Setup
- .tmux.conf is linked: ```ln ../dotfiles/.tmux.conf ~/.tmux.conf```

## tmux-create-sessionizer needs config directories
- tmux-create-sessionizer requires that environment variables are set, for example:
    ```
    export PROJECT_DIR="$HOME/projects"
    export CONFIG_DIR="$HOME/.config/nvim/lua/"
    ```
