local osType = vim.loop.os_uname().sysname
local api = vim.api
local util = require 'lspconfig.util'

local get_capabilities = function()
  local result =
      require('cmp_nvim_lsp').default_capabilities(
        vim.lsp.protocol.make_client_capabilities()
      )
  return result
end

local capabilities = get_capabilities()
-- vim.lsp.set_log_level('off')

local on_attach = function(client, bufnr)
  client.server_capabilities.semanticTokensProvider = nil
  local keymap_opts = { buffer = bufnr }

  vim.wo.signcolumn = "yes"
  --vim.opt.updatetime = 100
  -- nvim should not do auto completing for us
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
  -- query a symbol (like function name or struct name) and lsp *should* return location
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
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
  end
end

-- requires the tsserver installed and on path
require('lspconfig')['tsserver'].setup {
  on_attach = on_attach,
}
-- Requires vscode-lanaguage-server installed and on path
require('lspconfig')['eslint'].setup {
  on_attach = on_attach,
}

-- Requires vscode-lanaguage-server installed and on path
require('lspconfig')['cssls'].setup {
  on_attach = on_attach,
  cmd = { "vscode-css-language-server", "--stdio" },
  filetypes = { "css", "scss" },
  root_dir = util.root_pattern("package.json", ".git"),
  settings = { css = { validate = true }, scss = { validate = true } },
}

require('lspconfig')['clangd'].setup {
  on_attach = on_attach,
}

-- https://github.com/golang/tools/tree/master/gopls
require('lspconfig')['gopls'].setup {
  on_attach = on_attach,
  cmd = { 'gopls' },
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
  root_dir = util.root_pattern('go.mod', '.git'),
  single_file_supprt = true,
}

------------ JAVA JDTLS -----------------
-- jdtls config is OS specific
local eclipseLauncher
= os.getenv("HOME") .. "/lsps/jdtls/plugins/org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar"
local function getJDTLSConfig()
  if osType == "Darwin" then
    return os.getenv("HOME") .. "/lsps/jdtls/config_mac"
  else
    return os.getenv("HOME") .. "/lsps/jdtls/config_linux"
  end
end

local root_dir = require('jdtls.setup').find_root({'.git', 'mvnw', 'gradlew'})
local workspace_folder = os.getenv("HOME") .. "/workspace" .. vim.fn.fnamemodify(root_dir, ":p:h:t")
local jdtls_cmd = {
    -- NOTE: jdtls only works on java 17
    '/usr/bin/java_17/amazon-corretto-17.0.9.8.1-linux-x64/bin/java',
    '-Declipse.application=org.eclipse.jdt.ls.core.id1',
    '-Dosgi.bundles.defaultStartLevel=4',
    '-Declipse.product=org.eclipse.jdt.ls.core.product',
    '-Dlog.protocol=true',
    '-Dlog.level=ALL',
    '-Xmx1g',
    '--add-modules=ALL-SYSTEM',
    '--add-opens', 'java.base/java.util=ALL-UNNAMED',
    '--add-opens', 'java.base/java.lang=ALL-UNNAMED',
    '-jar', eclipseLauncher,
    '-configuration', getJDTLSConfig(),
    '-data', workspace_folder
}

require('lspconfig')['jdtls'].setup{
  cmd = jdtls_cmd,
  on_attach = on_attach
}

------------ END JAVA JDTLS ---------------

-- https://github.com/luals/lua-language-server/wiki/Getting-Started#command-line
require('lspconfig')['lua_ls'].setup {
  on_attach = on_attach,
  cmd = { "lua-language-server" },
  root_dir = util.root_pattern(".luarc.json", ".luarc.jsonc", ".luacheckrc", ".stylua.toml",
    "stylua.toml", "selene.toml"
    , "selene.yml", ".git"),
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { 'vim' },
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}

-- pip install pyright
require('lspconfig')['pyright'].setup {
  on_attach = on_attach,
  command = { "pyright", "--stdio" }
}

-- get_capabilities().textDocument.completion.completionItem.snippetSupport = true
require('lspconfig')['terraformls'].setup {
  pattern = { "*.tf", "*.tfvars" },
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
    { name = "path" },
    { name = "buffer" },
  },
  snippet = {
    preselect = cmp.PreselectMode.None,
    expand = function(args)
      -- Comes from vsnip
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  nomapping = cmp.mapping.preset.insert({
    ['<C-Space>'] = cmp.mapping.complete(),
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
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
  mapping = {
    ["<C-p>"] = cmp.mapping.select_prev_item(),
    ["<C-n>"] = cmp.mapping.select_next_item(),
    ["<S-Tab>"] = cmp.mapping.select_prev_item(),
    ["<Tab>"] = cmp.mapping.select_next_item(),
    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.close(),
    ["<CR>"] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Insert,
      select = true,
    }),
  },
})

-- METAL AND SCALA CONFIG
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
  on_attach(client, bufnr)
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

require('lspconfig')['zls'].setup {
  on_attach = on_attach,
  root_dir = util.root_pattern("build.zig", ".git"),
  docs = {
    description = [[]],
    default_config = {
      root_dir = [[root_pattern("build.zig", ".git")]],
    }
  }
}

require('lspconfig')['tflint'].setup {
  on_attach = on_attach,
  filetypes = { "terraform" },
  cmd = { "tflint", "--langserver" },
  root_dir = util.root_pattern(".terraform", ".git", ".tflint.hcl")
}

require('lspconfig')['pylsp'].setup {
  on_attach = on_attach,
}

local kub_ys =
"https://raw.githubusercontent.com/instrumenta/kubernetes-json-schema/master/v1.18.0-standalone-strict/all.json"

local gha_yaml_schema = "https://json.schemastore.org/github-workflow.json"
require('lspconfig')['yamlls'].setup {
  on_attach = on_attach,
  capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol
  .make_client_capabilities()),
  cmd = { "yaml-language-server", "--stdio" },
  root_dir = util.root_pattern(".git"),
  filetypes = { "yaml", "yaml.docker-compose", "helm", "yml" },
  settings = {
    yaml = {
      redhat = { telemetry = { enabled = false } },
      schemas = {
        [gha_yaml_schema] = "/.github/workflows/*",
        [kub_ys] = "/*.k8s.yaml",
      },
    },
  }
}

-- NOTE neede to remove this due to maybe (?) performance issue
--require('lspsaga').setup {
-- on_attach = on_attach,
--}

local rust_opts = {
  root_dir = util.root_pattern("Cargo.toml", "rust-project.json", ".git"),
  tools = {
    runnables = {
      use_telescope = true,
    },
    inlay_hints = {
      auto = true,
      show_parameter_hints = false,
      parameter_hints_prefix = "",
      other_hints_prefix = "",
    },
  },
  server = {
    on_attach = on_attach,
    settings = {
      ["rust-analyzer"] = {
        checkOnSave = {
          command = "clippy",
        },
      },
    },
  },
}
require('rust-tools').setup(rust_opts)

require('fidget').setup {}

require 'lspconfig'.bashls.setup {}
