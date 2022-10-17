 vim.opt.syntax = "on" 

vim.opt.errorbells = false
vim.opt.tabstop = 4 
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.nu = true
vim.opt.wrap = false 
vim.opt.smartcase = true
vim.opt.swapfile = false
vim.opt.backup = false 
vim.opt.undodir=os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true
vim.opt.incsearch = true
vim.opt.colorcolumn = "80"
vim.opt.title = true
vim.opt.relativenumber = true

vim.g.mapleader = "\\" --Default
