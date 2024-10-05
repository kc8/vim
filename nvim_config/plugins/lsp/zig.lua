local util = require 'lspconfig.util'

local function config(capabilities, onAttach)
  require('lspconfig')['zls'].setup {
    on_attach = onAttach,
    root_dir = util.root_pattern("build.zig", ".git"),
    docs = {
      description = [[]],
      default_config = {
        root_dir = [[root_pattern("build.zig", ".git")]],
      }
    }
  }
end

return config
