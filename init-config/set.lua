 
-- TODO: improvments and NOTE: the else statement is really for windows and the os.getenv("HOME") is 
-- for all unix/linux oses
function getUndoDir() 
    local home = os.getenv("HOME")
    if home ~= nil then 
        return home
    else 
        return "~/"
    end
end

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
vim.opt.undodir=getUndoDir("HOME") .. "/.vim/undodir"
vim.opt.undofile = true
vim.opt.incsearch = true
vim.opt.colorcolumn = "80"
vim.opt.title = true

vim.g.mapleader = "\\" --Default
