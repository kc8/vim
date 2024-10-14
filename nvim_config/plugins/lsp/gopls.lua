local util = require 'lspconfig.util'

local function config(capabilities, onAttach)
  require('lspconfig')['gopls'].setup {
    on_attach = onAttach,
    cmd = { 'gopls' },
    filetypes = { "go", "gomod", "gowork", "gotmpl" },
    root_dir = util.root_pattern('go.mod', '.git'),
    single_file_supprt = true,
    capabilities = capabilities,
  }
end

return config
