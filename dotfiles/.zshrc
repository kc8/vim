source $HOME/.additional_config.sh
export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=/usr/local/bin/nvim/bin:$PATH

export PATH=/usr/local/bin/cmake/bin:$PATH
# lsps and prog langs
export PATH=$HOME/prog_langs:$PATH
export PATH=$HOME/prog_langs/zig:$PATH
export PATH=$HOME/prog_langs/go/bin:$PATH
export PATH=$HOME/lsps/lua/bin:$PATH
export PATH=$HOME/lsps/zig/bin:$PATH
export PATH=$HOME/lsps/terraform/tflint:$PATH
export PATH=$HOME/lsps/terraform:$PATH
export PATH=$HOME/.cargo/bin:$PATH
export PATH=$HOME/lsps/rust-analyzer:$PATH
export PATH=$HOME/projects/sql-nvim:$PATH
export PATH=$HOME/node/bin:$PATH
export PATH=$HOME/go/bin:$PATH
export PATH=$HOME/projects/misc-utils/bin:$PATH
export FLYCTL_INSTALL="$HOME/.fly"
export PATH="$FLYCTL_INSTALL/bin:$PATH"

export EDITOR="nvim"

# general bins
export PATH=$HOME/bins/:$PATH

# TMUX config
export PATH=$HOME/.config/nvim/lua/vim/bin:$PATH
bindkey -s ^f "tmux-create-session.sh\n" #assumes vim config above is on path

## dirs that tmux-create-session will look for
export PROJECT_DIR="$HOME/projects"
export CONFIG_DIR="$HOME/.config/nvim/lua/"

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

zstyle ':omz:update' mode auto
zstyle ':omz:update' frequency 14

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# plugins
plugins=(git)

source $ZSH/oh-my-zsh.sh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
