local keymapper = require("vim.keymapper")
local vnoremap = keymapper.vnoremap
local nnoremap = keymapper.nnoremap

return {
  {
    "nvim-lua/plenary.nvim",
    branch = "master",
    config = function()
      require("copilot").setup({})
    end
  },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "nvim-lua/plenary.nvim", branch = "master" },
      { "zbirenbaum/copilot.lua" }
    },
    build = "make tiktoken",
    config = function()
      require("CopilotChat").setup({
        mappings = {
          close = {
            normal = 'q',
            insert = ''
          }
        }
      })
      vnoremap("<leader>ch", ":CopilotChatToggle<CR>")
      nnoremap("<leader>ch", ":CopilotChatToggle<CR>")
    end,
  },
}
