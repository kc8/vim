local util = require 'lspconfig.util'

local function config(capabilities, onAttach)
require('lspconfig')['tflint'].setup {
  on_attach = onAttach,
  filetypes = { "terraform" },
  cmd = { "tflint", "--langserver" },
  capabilities = capabilities,
  root_dir = util.root_pattern(".terraform", ".git", ".tflint.hcl")
}
end

return config
