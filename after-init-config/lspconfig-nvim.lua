local keymapper = require("vim.init-config.keymapper")
local nnoremap = keymapper.nnoremap
local api = vim.api
local cmd = vim.cmd

local util = require 'lspconfig.util'

local function map(mode, lhs, rhs, opts)
  local options = { noremap = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  api.nvim_set_keymap(mode, lhs, rhs, options)
end


-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

-- TODO I do not know if I want this to 'attach'

local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  vim.opt_global.completeopt = { "menuone", "noinsert", "noselect" }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
  map("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>")
  map("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>")
  map("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>")
  map("n", "gds", "<cmd>lua vim.lsp.buf.document_symbol()<CR>")
  map("n", "gws", "<cmd>lua vim.lsp.buf.workspace_symbol()<CR>")
  map("n", "<leader>cl", [[<cmd>lua vim.lsp.codelens.run()<CR>]])
  map("n", "<leader>sh", [[<cmd>lua vim.lsp.buf.signature_help()<CR>]])
  map("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>")
  map("n", "<leader>f", "<cmd>lua vim.lsp.buf.formatting()<CR>")
  -- code action was moved to lspgaga
  -- map("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>")
  map("n", "<leader>ws", '<cmd>lua require"metals".hover_worksheet()<CR>')

  map("n", "<leader>aa", [[<cmd>lua vim.diagnostic.setqflist()<CR>]]) 
  map("n", "<leader>ae", [[<cmd>lua vim.diagnostic.setqflist({severity = "E"})<CR>]])
  map("n", "<leader>aw", [[<cmd>lua vim.diagnostic.setqflist({severity = "W"})<CR>]]) 
  map("n", "<leader>d", "<cmd>lua vim.diagnostic.setloclist()<CR>")

  map("n", "[c", "<cmd>lua vim.diagnostic.goto_prev { wrap = false }<CR>")
  map("n", "]c", "<cmd>lua vim.diagnostic.goto_next { wrap = false }<CR>")

  local signs = { Error = "⬤", Warn = "▲", Hint = "🔍", Info = "ⓘ" }
  for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
  end
end

-- requires the tserber installed and on path
require('lspconfig')['tsserver'].setup{
    on_attach = on_attach,
    flags = lsp_flags,

}
-- requires the tserber installed and on path
require('lspconfig')['clangd'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
}

-- Requires vscode-lanaguage-server installed and on path
require('lspconfig')['eslint'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
}
-- Requires vscode-lanaguage-server installed and on path
require('lspconfig')['cssls'].setup{
    on_attach = on_attach,
    cmd = {"vscode-css-language-server", "--stdio"},
    filetypes = {"css", "scss"},
    --root_dir = root_pattern("package.json", ".git"),
    settings = {css = {validate=true}, scss={validate=true}},
    single_file_support = true,
    flags = lsp_flags,
}

-- https://github.com/golang/tools/tree/master/gopls 
require('lspconfig')['gopls'].setup{
  on_attach = on_attach,
  cmd = {'gopls'},
  filetypes = { "go", "gomod", "gowork", "gotmpl" }, 
  root_dir = util.root_pattern('go.mod', '.git'),
  single_file_supprt = true,
}

-- Requires vscode-lanaguage-server installed and on path
-- Needs to built with the current jdk version 
-- then the command to the starting teh server is here
require('lspconfig')['java_language_server'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
    cmd = {"sh", "/Users/kyle.cooper/java-language-server/dist/lang_server_mac.sh"},
}

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true 
require('lspconfig')['terraformls'].setup{
  pattern = {"*.tf", "*.tfvars"},
  callback = vim.lsp.buf.formatting_sync,
  capabilities = capabilities,
}

-- nvim-cmp settings
-- Taken from https://github.com/scalameta/nvim-metals/discussions/39
local cmp = require("cmp")
cmp.setup({
  sources = {
    { name = "nvim_lsp" },
    { name = "vsnip" },
  },
  snippet = {
    expand = function(args)
      -- Comes from vsnip
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
      ['<C-Space>'] = cmp.mapping.complete(),
    -- None of this made sense to me when first looking into this since there
    -- is no vim docs, but you can't have select = true here _unless_ you are
    -- also using the snippet stuff. So keep in mind that if you remove
    -- snippets you need to remove this select
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
    -- I use tabs... some say you should stick to ins-completion but this is just here as an example
    ["<Tab>"] = function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      else
        fallback()
      end
    end,
    ["<S-Tab>"] = function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      else
        fallback()
      end
    end,
  }),
})

-- METAL AND SCALA CONFIG 
-- Taken from https://github.com/scalameta/nvim-metals/discussions/39
-- see plugin lua file for details on this
local metals_config = require("metals").bare_config()

metals_config.on_attach = on_attach;
metals_config.settings = {
  showImplicitArguments = true,
  excludedPackages = { "akka.actor.typed.javadsl", "com.github.swagger.akka.javadsl" },
}

local nvim_metals_group = api.nvim_create_augroup("nvim-metals", { clear = true })
api.nvim_create_autocmd("FileType", {
  pattern = { "scala", "sbt" },
  callback = function()
    require("metals").initialize_or_attach(metals_config)
  end,
  group = nvim_metals_group,
})

require('lspconfig')['zls'].setup{
  on_attach = on_attach
}
