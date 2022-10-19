local keymapper = require("vim.init-config.keymapper")
local nnoremap = keymapper.nnoremap

-- Set windows settings
-- Allows pasting with mouse click
nnoremap("<silent><RightMouse>", ":call GuiShowContextMenu()<CR>")
