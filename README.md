# VIM RC FILES AND CONFIG 


## Setup

1. Create an init.lua (or init.vim) insiead of the config directory (~/.config/nvim/[xxxx]) for your VIM setup
2. Pull down this repo and it will create a vim dir inside the vim config directory
3. Inside the init.lua that you created earlier, require("vim") and everything should start to function -> or if uising .vimrc, source the .vimrc file as needed)
4. Install [Packer](https://github.com/wbthomason/packer.nvim)

## Using LUA
Inside the config path for VIM you will need to create something c 'lua', for example lua/vim. VIM will look inside the lua for namespaces. So your init.lua file will look like 

```sh 
require("vim")
```

which will tell vim to look inside the lua directory and then look for the vim (or this repo)


## Important Notes
- Telescope plugin uses a specific tag for release
