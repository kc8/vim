local function config(capabilities, onAttach)
  vim.g.zig_fmt_autosave = 0

  return {
    capabilities = capabilities,
    on_attach = onAttach,
    docs = {
      description = [[]],
      default_config = {
        root_dir = [[root_pattern("build.zig", ".git")]],
      }
    }
  }
end

return config
