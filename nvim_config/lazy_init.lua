local lzp = vim.fn.stdpath('data') .. "lazy/lazy.nvim"

local isBootstraped = not vim.uv.fs_stat(lzp)
if not isBootstraped then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lzp,
  })
end

vim.opt.rtp:prepend(lzp)

require("lazy").setup({
    spec = "vim.nvim_config.plugins",
    change_detection = { notify = false }
})
