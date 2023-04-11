local osSettings = require("vim.get_os")
local localConfigDir = osSettings.getVimConfigDir
local autocmd = vim.api.nvim_create_autocmd
local autogroup = vim.api.nvim_create_augroup

local keymapper = require("vim.init-config.keymapper")
local nnoremap = keymapper.nnoremap
local inoremap = keymapper.inoremap
local vnoremap = keymapper.vnoremap
local xnoremap = keymapper.xnoremap

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
vim.opt.undodir = localConfigDir .. "/.vim/undodir"
vim.opt.undofile = true
vim.opt.incsearch = true
vim.opt.colorcolumn = "80"
vim.opt.title = true
vim.opt.relativenumber = true
vim.g.mapleader = "\\" --Default

vim.opt.termguicolors = true
vim.opt.signcolumn = "yes"

-- TODO vim..opt.mouse does not work for this
vim.cmd [[set mouse=a]]

nnoremap("<C-c>", "<Esc>")
inoremap("<C-c>", "<Esc>")
vnoremap("<C-c>", "<Esc>")

-- TODO we want to remap esc to something other than ctrl + c but not sure what yet
nnoremap("<C-c>", "<Esc>")
inoremap("<C-c>", "<Esc>")
vnoremap("<C-c>", "<Esc>")

nnoremap("<c-d>", "<c-d>zz")
nnoremap("<c-u>", "<c-u>zz")
nnoremap("n", "nzzzv")
nnoremap("N", "Nzzzv")

-- select line and move around up and down
vnoremap("J", ":m '>+1<CR>gv=gv")
vnoremap("K", ":m '<-2<CR>gv=gv")

vim.keymap.set("x", "<leader>p", [["_dP]])

-- yank into system clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- find and replace in document, gets current word cursor is under
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- TODO finish this at somepoint
local currentCursorLine = function()
    local r, _ = vim.api.nvim_win_get_cursor(0)
    return "<cmd>" ..r[1].. "GBrowse<CR>"
end

vim.keymap.set("n", "<leader>gt", currentCursorLine)
vim.keymap.set("n", "<leader>gb", "<cmd>GBrowse<CR>")
vim.keymap.set("n", "<leader>gl", "<cmd>Git blame<CR>")

local yankgroup = autogroup('highlightOnYank', {})
autocmd('TextYankPost', {
    group = yankgroup,
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeout = 40,
        })
    end,
})
