-- TODO make this more robust, covnert the coc-config into lua or something else
thisDir = "~/.config/nvim/lua/vim/after-init-config/"
vim.cmd('source' ..thisDir .. 'coc-config.vim')
