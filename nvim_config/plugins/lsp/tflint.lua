local function config(capabilities, onAttach)
  return {
    on_attach = onAttach,
    filetypes = { "terraform" },
    cmd = { "tflint", "--langserver" },
    capabilities = capabilities,
  }
end

return config
