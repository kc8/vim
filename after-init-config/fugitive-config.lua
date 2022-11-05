local keymapper = require("vim.init-config.keymapper")
local nnoremap = keymapper.nnoremap

-- merging diffs
nnoremap("<leader>gf", ":diffget //2<CR>")
nnoremap("<leader>gj", ":diffget //2<CR>")

--Open git status
nnoremap("<leader>gs", ":G<CR>")

