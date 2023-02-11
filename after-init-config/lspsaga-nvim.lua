local keymap = vim.keymap.set
local saga = require('lspsaga')
local keymapper = require("vim.init-config.keymapper")
local nnoremap = keymapper.nnoremap
local api = vim.api
local cmd = vim.cmd

--saga.init_lsp_saga({
 --   server_filetype_map = {metals= {"sbt", "scala"}},
--})

