$HOME/.additional_config.sh
export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=/usr/local/bin/nvim/bin:$PATH

export PATH=/usr/local/bin/cmake/bin:$PATH
# lsps
export PATH=$HOME/lsps/lua/bin:$PATH
export PATH=$HOME/lsps/zig/bin:$PATH
export PATH=$HOME/lsps/terraform/tflint:$PATH
export PATH=$HOME/lsps/terraform:$PATH
export PATH=$HOME/.cargo/bin:$PATH
export PATH=$HOME/lsps/rust-analyzer:$PATH
export PATH=$HOME/projects/sql-nvim:$PATH
export PATH=$HOME/node/bin:$PATH

export PATH=$HOME/go/bin:$PATH

# prog langs
export PATH=$HOME/prog_langs:$PATH
export PATH=$HOME/prog_langs/zig:$PATH
export PATH=$HOME/prog_langs/go/bin:$PATH

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
