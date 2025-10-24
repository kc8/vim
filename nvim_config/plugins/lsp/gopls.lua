local function config(capabilities, onAttach)
  return {
    on_attach = onAttach,
    cmd = { 'gopls' },
    filetypes = { "go", "gomod", "gowork", "gotmpl" },
    single_file_supprt = true,
    capabilities = capabilities,
  }
end

return config
