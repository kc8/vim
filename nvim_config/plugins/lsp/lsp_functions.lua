local utils = {}
local on_attach = function(client, bufnr)
  -- the below turns off LSPs from controlling color schemes
  client.server_capabilities.semanticTokensProvider = nil
  local keymap_opts = { buffer = bufnr }

  vim.wo.signcolumn = "yes"
  vim.o.completeopt = "menuone,noinsert,noselect"
  vim.opt.shortmess = vim.opt.shortmess + "c"

  -- shortcuts
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, keymap_opts)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, keymap_opts)
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, keymap_opts)
  vim.keymap.set("n", "<c-k>", vim.lsp.buf.signature_help, keymap_opts)
  vim.keymap.set("n", "gD", vim.lsp.buf.type_definition, keymap_opts)
  vim.keymap.set("n", "gr", vim.lsp.buf.references, keymap_opts)
  vim.keymap.set("n", "gds", vim.lsp.buf.document_symbol, keymap_opts)
  vim.keymap.set("n", "gws", vim.lsp.buf.workspace_symbol, keymap_opts)
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, keymap_opts)
  vim.keymap.set("n", "<leader>cl", vim.lsp.codelens.run, keymap_opts)
  vim.keymap.set("n", "<leader>sh", vim.lsp.buf.signature_help, keymap_opts)
  vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, keymap_opts)
  vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, keymap_opts)
  vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, keymap_opts)
  --keymap({ "n", "v" }, "<leader>ca", "<cmd>Lspsaga code_action<CR>")

  -- See `:help vim.diagnostic.*` for documentation on any of the below functions
  local opts = { noremap = true, silent = true }
  vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
  vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
  vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
  vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

  -- show diag when curosr hold
  local diag_float_grp = vim.api.nvim_create_augroup("DiagnosticFloat", { clear = true })
  vim.api.nvim_create_autocmd("CursorHold", {
    callback = function()
      vim.diagnostic.open_float(nil, { focusable = false })
    end,
    group = diag_float_grp,
  })

  local signs = { Error = "●", Warn = "▲", Hint = "🔍", Info = "ⓘ" }
  for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.diagnostic.config(hl, { text = icon, texthl = hl, numhl = hl })
  end
end

local cmpLsp = require("cmp_nvim_lsp")
local capabilities = vim.tbl_deep_extend(
  "force",
  {},
  vim.lsp.protocol.make_client_capabilities(),
  cmpLsp.default_capabilities())

utils.onAttach = on_attach
utils.capabilities = capabilities

return utils
