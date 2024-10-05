local util = require 'lspconfig.util'

local function config(capabilities, onAttach)
  require('lspconfig')['zls'].setup {
    capabilities = capabilities,
    on_attach = onAttach,
    root_dir = util.root_pattern("build.zig", ".git"),
    docs = {
      description = [[]],
      default_config = {
        root_dir = [[root_pattern("build.zig", ".git")]],
      }
    }
  }
  vim.g.zig_fmt_autosave = 0
end

return config
