local function config(capabilities, onAttach)
require('lspconfig')['tflint'].setup {
  on_attach = onAttach,
  filetypes = { "terraform" },
  cmd = { "tflint", "--langserver" },
  capabilities = capabilities,
}
end

return config
