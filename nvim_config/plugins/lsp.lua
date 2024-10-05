return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/nvim-cmp",
    "j-hui/fidget.nvim",
  },
  config = function()
    local cmp = require("cmp")
    local cmpLsp = require("cmp_nvim_lsp")
    local capabilities = vim.tbl_deep_extend(
      "force",
      {},
      vim.lsp.protocol.make_client_capabilities(),
      cmpLsp.default_capabilities())

    local onAttach = require("vim.nvim_config.plugins.lsp.onattach")

    --- MASON LSP SETTINGS ---
    require("mason").setup()
    require("mason-lspconfig").setup({
      ensure_installed = {
        "lua_ls",
        "gopls",
        -- "nvim-metals", -- TODO not supported
        "tflint",
        "zls",
        "pylsp",
        "yamlls",
        "bashls",
        "ts_ls",
        "eslint",
        "cssls",
        "clangd",
        "jdtls"
      },
      automatic_installation = false,
      handlers = {
        ['gopls'] = require("vim.nvim_config.plugins.lsp.gopls")(capabilities, nil),
        ['lua_ls'] = require("vim.nvim_config.plugins.lsp.luals")(capabilities, nil),
        ['tflint'] = require("vim.nvim_config.plugins.lsp.tflint")(capabilities, nil),
        ['zls'] = require("vim.nvim_config.plugins.lsp.zig")(capabilities, nil),
        ['yamlls'] = require("vim.nvim_config.plugins.lsp.yaml")(capabilities, nil),
        ['jdtls'] = require("vim.nvim_config.plugins.lsp.java")(capabilities, nil),

        ['pylsp'] = function()
          require('lspconfig')['pylsp'].setup { on_attach = nil, }
        end,
        ["ts_ls"] = function()
          require('lspconfig')['ts_ls'].setup {
            on_attach = onAttach,
          }
        end,
        ["eslint"] = function()
          require('lspconfig')['eslint'].setup {
            on_attach = onAttach,
          }
        end,
        ["cssls"] = function()
          require('lspconfig')['cssls'].setup {
            on_attach = onAttach,
          }
        end,
        ["clangd"] = function()
          require('lspconfig')['clangd'].setup {
            on_attach = onAttach,
          }
        end,
        ["bashls"] = function()
          require('lspconfig')['bashls'].setup {
            on_attach = onAttach,
          }
        end,
      },
    })

    local cmp_select = { behavior = cmp.SelectBehavior.Select }
    cmp.setup({
      mapping = cmp.mapping.preset.insert({
        ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
        ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
        ['<C-y>'] = cmp.mapping.confirm({ select = true }),
        ["<C-Space>"] = cmp.mapping.complete(),
      }),
      sources = cmp.config.sources({
        { name = 'nvim_lsp' },
      }, {
        { name = 'buffer' },
      })
    })
    vim.diagnostic.config({
      -- update_in_insert = true,
      float = {
        focusable = false,
        style = "minimal",
        border = "rounded",
        source = "always",
        header = "",
        prefix = "",
      },
    })
  end
}
