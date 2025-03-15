local osSettings = require("vim.get_os")
local localConfigDir = osSettings.getVimConfigDir
local autocmd = vim.api.nvim_create_autocmd
local autogroup = vim.api.nvim_create_augroup

local keymapper = require("vim.keymapper")
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

-- TODO remap esc to something other than ctrl + c but not sure what yet
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

local currentCursorLine = function()
  local r, _ = vim.api.nvim_win_get_cursor(0)
  return "<cmd>" .. r[1] .. "GBrowse<CR>"
end

vim.keymap.set("n", "<Leader>gt", currentCursorLine)
vim.keymap.set("n", "<Leader>gb", "<cmd>GBrowse<CR>")
vim.keymap.set("n", "<Leader>gl", "<cmd>Git blame<CR>")
vim.keymap.set("n", "<Leader>g", "<cmd>Git<CR>")

-- quick fix list
vim.keymap.set("n", "<Leader>ck", ":cnext<CR>")
vim.keymap.set("n", "<Leader>cj", ":cprev<CR>")
vim.keymap.set("n", "<Leader>ce", ":copen<CR>")

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

--  Open netrw in new vsp
nnoremap("<Leader><CR>", ":Vex<CR>")
-- source the nvim config
nnoremap("<Leader>=", ":so ~/.config/nvim/init.lua<CR>")

vim.keymap.set('n', "<silent><RightMouse>", ":call GuiShowContextMenu()<CR>")

-- file formats
vim.cmd([[silent! autocmd! filetypedetect BufRead,BufNewFile *.tf]])
vim.cmd([[autocmd BufRead,BufNewFile *.hcl set filetype=hcl]])
vim.cmd([[autocmd BufRead,BufNewFile .terraformrc,terraform.rc set filetype=hcl]])
vim.cmd([[autocmd BufRead,BufNewFile *.tf,*.tfvars set filetype=terraform]])
vim.cmd([[autocmd BufRead,BufNewFile *.tfstate,*.tfstate.backup set filetype=json]])

vim.cmd([[let g:terraform_align=1]])

-- tf commands within nvim
-- TODO remap for terraform functions
-- keymap("n", "<leader>ti", ":!terraform init<CR>", opts)
-- keymap("n", "<leader>tv", ":!terraform validate<CR>", opts)
-- keymap("n", "<leader>tp", ":!terraform plan<CR>", opts)
-- keymap("n", "<leader>taa", ":!terraform apply<CR>", opts)

-- Custom treesitter highlight
-- vim.cmd([[hi @function.builtin guifg.pink]])

-- Prevent defaults for from :h sql-completion-static function
-- Not having this will cause a `C` char to appear at the end of sql file types when using ctl-c
vim.g.ftplugin_sql_omni_key = '<C-kk>'

