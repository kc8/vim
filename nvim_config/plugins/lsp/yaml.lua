local util = require 'lspconfig.util'

local function config(capabilities, onAttach)
  local kub_ys =
  "https://raw.githubusercontent.com/instrumenta/kubernetes-json-schema/master/v1.18.0-standalone-strict/all.json"

  local gha_yaml_schema = "https://json.schemastore.org/github-workflow.json"
  require('lspconfig')['yamlls'].setup {
    on_attach = onAttach,
    capabilities = capabilities,
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
end

return config
