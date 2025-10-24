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
    -- local cmpLsp = require("cmp_nvim_lsp")
    local capabilities = require("vim.nvim_config.plugins.lsp.lsp_functions").capabilities
    local onAttach = require("vim.nvim_config.plugins.lsp.lsp_functions").onAttach

    --- MASON LSP SETTINGS ---
    require("mason").setup()
    require("mason-lspconfig").setup({
      ensure_installed = {
        "lua_ls",
        "gopls",
        -- "nvim-metals", -- not supported
        "tflint",
        "zls",
        "pylsp",
        "yamlls",
        "bashls",
        "ts_ls",
        "eslint",
        "cssls",
        "clangd",
        "jdtls",
        "terraformls",
      },
      automatic_installation = false,
      handlers = {
        ['terraformls'] =
            vim.lsp.config('terraformls',
              require("vim.nvim_config.plugins.lsp.terraform")(capabilities, onAttach)
            ),
        ['tflint'] =
            vim.lsp.config('tflint',
              require("vim.nvim_config.plugins.lsp.tflint")(capabilities, onAttach)
            ),
        ['jdtls'] =
            vim.lsp.config('jdtls',
              require("vim.nvim_config.plugins.lsp.java")(capabilities, onAttach)
            ),
        ['yamlls'] =
            vim.lsp.config('yamlls',
              require("vim.nvim_config.plugins.lsp.yaml")(capabilities, onAttach)
            ),

        ['zls'] = vim.lsp.config('zls',
          require("vim.nvim_config.plugins.lsp.zig")(capabilities, onAttach)
        ),
        ['gopls'] = vim.lsp.config('gopls',
          require("vim.nvim_config.plugins.lsp.gopls")(capabilities, onAttach)
        ),
        ['lua_ls'] = vim.lsp.config('lua_ls',
          require("vim.nvim_config.plugins.lsp.luals")['config'](capabilities, onAttach)),
        ['pylsp'] =
            vim.lsp.config('pylsp', {
              on_attach = nil,
            }),
        ["ts_ls"] =
            vim.lsp.config('ts_ls', {
              on_attach = onAttach,
              capabilities = capabilities,
            }),
        ["eslint"] =
            vim.lsp.config('eslint', {
              on_attach = onAttach,
              capabilities = capabilities,
            }),
        ["cssls"] =
            vim.lsp.config('cssls', {
              on_attach = onAttach,
            }),
        ["clangd"] =
            vim.lsp.config('clangd', {
              on_attach = onAttach,
            }),
        ["bashls"] =
            vim.lsp.config('bashls', {
              on_attach = onAttach,
            }),
      },
    })
    local cmp_select = { behavior = cmp.SelectBehavior.Select }
    cmp.setup({
      mapping = cmp.mapping.preset.insert({
        ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
        ['<C-j>'] = cmp.mapping.select_next_item(cmp_select),
        ["<Tab>"] = cmp.mapping.select_next_item(),
        ['<C-y>'] = cmp.mapping.confirm({ select = true }),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-d>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-e>"] = cmp.mapping.close(),
        ["<CR>"] = cmp.mapping.confirm({
          behavior = cmp.ConfirmBehavior.Insert,
          select = true,
        }),
      }),
      sources = cmp.config.sources({
        { name = 'nvim_lsp' },
      }, {
        { name = 'buffer' },
      })
    })
    vim.diagnostic.config({
      float = {
        focusable = false,
        style = "minimal",
        border = "rounded",
        source = "always",
        header = "",
        prefix = "",
      },
    })
    require("fidget").setup({})
  end
}
