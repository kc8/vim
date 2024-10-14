local util = require 'lspconfig.util'

local function config(capabilities, onAttach)
  local lspConfig = require("lspconfig")
  lspConfig.lua_ls.setup {
    on_attach = onAttach,
    capabilities = capabilities,
    cmd = { "lua-language-server" },
    root_dir = util.root_pattern(".luarc.json", ".luarc.jsonc", ".luacheckrc", ".stylua.toml",
      "stylua.toml", "selene.toml", "selene.yml", ".git"),
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

return config
