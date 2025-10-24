local function config(capabilities, onAttach)
  return {
    pattern = { "*.tf", "*.tfvars" },
    callback = vim.lsp.buf.formatting_sync,
    capabilities = capabilities,
    on_attach = onAttach,
  }
end

return config
