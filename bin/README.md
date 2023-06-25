# READ ME

## Helpful scripts for living life in the terminal

### Pre-Reqs
- tmux must be installed
- There are some env variables that you need 
- Assumes working with bash and zsh
- fzf must be installed 
- (1) Setup path for this dir ex: ```PATH="$HOME/.config/nvim/lua/vim/bin:$PATH"```

## tmux config setup
1. I decided to hard link the conf here to the my home dir ```ln $(echo $TMUX_CONFIG) ~/.tmux.conf``` 
while the TMUX_CONFIG is an exported var to this [here]/.tmux.conf
    - There are also other places tmux reads/checks for the config

## zsh specific commands
- [Bind Key Notiation](https://github.com/rothgar/mastering-zsh/blob/master/docs/helpers/bindkey.md)
```
bindkey -s ^f "tmux-create-session.sh\n" // NOTE: must be on path with (1)
```

## tmux-create-session
You will need to set some env vars for dirs you want to search for

```
export PROJECT_DIR="$HOME/projects"
export NOTES_DIR="$HOME/notes/DAILIES/"
export CONFIG_DIR="$HOME/.config/nvim/lua/vim"
```

## tmux cheat sheet
- [c -d]: close session

[some config here](https://tmuxguide.readthedocs.io/en/latest/tmux/tmux.html#installation)
