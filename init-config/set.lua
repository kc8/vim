local osSettings = require("vim.get_os")
local localConfigDir = osSettings.getVimConfigDir

local keymapper = require("vim.init-config.keymapper")
local nnoremap = keymapper.nnoremap
local inoremap = keymapper.inoremap
local vnoremap = keymapper.vnoremap

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
-- OLD METHOD DOES NOT WORK CORRECT ON WINDOWS 
-- vim.opt.undodir=os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undodir=localConfigDir .. "/.vim/undodir"
vim.opt.undofile = true
vim.opt.incsearch = true
vim.opt.colorcolumn = "80"
vim.opt.title = true
vim.opt.relativenumber = true
vim.g.mapleader = "\\" --Default

-- TODO vim..opt.mouse does not work for this
vim.cmd [[set mouse=a]]

nnoremap("<C-c>", "<Esc>")
inoremap("<C-c>", "<Esc>")
vnoremap("<C-c>", "<Esc>")

nnoremap("<c-d>", "<c-d>zz")
nnoremap("<c-u>", "<c-u>zz")
nnoremap("n", "nzzzv")
nnoremap("N", "Nzzzv")
