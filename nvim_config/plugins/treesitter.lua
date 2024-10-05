return {
  {
    "nvim-treesitter/nvim-treesitter-context"
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "javascript", "python", "c", "lua", "scala", "bash", "java", "cpp",
          "markdown", "hcl" },
        sync_install = false,
        auto_install = false,
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
      })
    end
  }
}
