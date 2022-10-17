local keymapper = require("vim.init-config.keymapper")
local nnoremap = keymapper.nnoremap

nnoremap("<silent><RightMouse>", ":call GuiShowContextMenu()<CR>")
