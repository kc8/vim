# Vim Config Files 

## Initial Setup (working on Linux/Unix)

1. Create an init.lua (or init.vim) insider of the config directory (~/.config/nvim/[xxxx]) for your VIM setup
1. Create a ./lua directory there and pull down this repo inside of that directory
1. Inside the init.lua that you created earlier, require("vim") and everything should start to function -> or if uising .vimrc, source the .vimrc file as needed)
1. Install [Packer](https://github.com/wbthomason/packer.nvim) 
1. After installing packer, you should be able to restart the nvim session and run `:packer install`

## Using LUA
Inside the config path for VIM you will need to create something c 'lua', for example lua/vim. VIM will look inside the lua for namespaces. So your init.lua file will look like 

```sh 
require("vim")
```
which will tell vim to look inside the lua directory and then look for the vim (or this repo)

## LSPs 
These need to be installed seperatley and added to paths so that nvim lsp can initalize them when opening their respetive files
There are some docs inside the lsp config files on how to get started

## Other Notes
- Telescope plugin uses a specific tag for release
