require("vim.nvim_config.set")
require("vim.nvim_config.lazy_init")

vim.g.zig_fmt_autosave = 0
vim.cmd("colorscheme gruvbox")

require("vim.after-init-config.gui-settings")

