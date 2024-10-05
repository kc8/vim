local util = require 'lspconfig.util'

local function config(capabilities, onAttach)
  require('lspconfig')['cssls'].setup {
    on_attach = onAttach,
    cmd = { "vscode-css-language-server", "--stdio" },
    filetypes = { "css", "scss" },
    root_dir = util.root_pattern("package.json", ".git"),
    settings = { css = { validate = true }, scss = { validate = true } },
  }
end

return config
