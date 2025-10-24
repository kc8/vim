local function config(capabilities, onAttach)
  return {
    attr = "attr",
    on_attach = onAttach,
    capabilities = capabilities,
    cmd = { "lua-language-server" },
    settings = {
      Lua = {
        runtime = { version = 'LuaJIT', },
        diagnostics = {
          globals = { 'vim ' },
          workspace = {
            library = vim.api.nvim_get_runtime_file("", true),
          },
          telemetry = {
            enable = false,
          },
        },
      },
    }
  }
end

return { config = config }
