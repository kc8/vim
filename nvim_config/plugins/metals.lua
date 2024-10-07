return {
  'scalameta/nvim-metals',
  requires = {
    { 'nvim-lua/plenary.nvim' },
    { 'mfussenegger/nvim-dap' },
  },
  config = function()
    local api = vim.api
    local capabilities = require("vim.nvim_config.plugins.lsp.lsp_functions").capabilities
    local onAttach = require("vim.nvim_config.plugins.lsp.lsp_functions").onAttach
    -- Taken from https://github.com/scalameta/nvim-metals/discussions/39
    -- see plugin lua file for details on this
    local metals_config = require("metals").bare_config()
    metals_config.tvp = {
      icons = {
        enabled = true,
      }
    }
    --metals_config.capabilities = require("cmp_nvim_lsp").default_capabilities()
    metals_config.capabilities = capabilities
    metals_config.init_options.statusBarProvider = "on"

    metals_config.on_attach = function(client, bufnr)
      onAttach(client, bufnr)
      vim.keymap.set("n", "<leader>tt", require("metals.tvp").toggle_tree_view)
      api.nvim_create_autocmd("CursorHold", {
        callback = vim.lsp.buf.document_highlight,
        buffer = bufnr,
      })
      api.nvim_create_autocmd("CursorMoved", {
        callback = vim.lsp.buf.clear_references,
        buffer = bufnr,
      })
      api.nvim_create_autocmd({ "BufEnter", "BufWritePost" }, {
        callback = vim.lsp.codelens.refresh,
        buffer = bufnr,
      })
    end

    metals_config.settings = {
      showImplicitArguments = true,
      showInferredType = true,
      showImplicitConversionsAndClasses = true,
      serverVersion = "latest.snapshot",
      excludedPackages = { "akka.actor.typed.javadsl", "com.github.swagger.akka.javadsl" },
      --scalafixConfigPath = util.root_pattern(".git")
    }

    local nvim_metals_group = api.nvim_create_augroup("nvim-metals", { clear = true })
    api.nvim_create_autocmd("FileType", {
      pattern = { "scala", "sbt" }, -- JAVA is set here, we may want to remove it
      callback = function()
        require("metals").initialize_or_attach(metals_config)
      end,
      group = nvim_metals_group,
    })
  end
}
