return {
  {
    "nvim-lua/plenary.nvim",
    name = "plenary"
  },
  { "airblade/vim-gitgutter" },
  {
    "tpope/vim-rhubarb",
    config = function()
      local keymapper = require("vim.init-config.keymapper")
      local nnoremap = keymapper.nnoremap

      -- merging diffs
      nnoremap("<leader>gf", ":diffget //2<CR>")
      nnoremap("<leader>gj", ":diffget //2<CR>")

      --Open git status
      nnoremap("<leader>gs", ":G<CR>")

      vim.g.github_enterprise_urls = { os.getenv('GHE_URL') }
    end
  },
  {
    'scalameta/nvim-metals',
    requires = {
      { 'nvim-lua/plenary.nvim' },
      { 'mfussenegger/nvim-dap' },
    }
  },
  {
    'morhetz/gruvbox',
    conifig = function()
      vim.cmd("colorscheme gruvbox")
      -- vim.opt.background = "dark"
    end
  },
  { 'sainnhe/sonokai' },
  { 'rose-pine/neovim' },
  { 'editorconfig/editorconfig-vim' },
  { 'tpope/vim-fugitive' },
  { 'vim-airline/vim-airline' },
  {
    "mbbill/undotree",
    config = function()
      vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
    end
  },
}
