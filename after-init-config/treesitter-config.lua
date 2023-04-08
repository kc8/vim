require 'nvim-treesitter.configs'.setup {
  ensure_installed = { "javascript", "python", "c", "lua", "scala", "bash", "java", "cpp", "markdown" },
  sync_install = false,
  -- NOTE: there is some kind of bug that is causing crashing in the current version of treesitter
  -- when loading in all these parsers
  -- This will crash when using :checkhealth, at least it forces it to crash
  auto_install = false,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}

require 'nvim-treesitter.install'.prefer_git = false
require 'nvim-treesitter.install'.compilers = { "clang", "gcc" }
