local osType = vim.loop.os_uname().sysname

------------ JAVA JDTLS -----------------
-- jdtls config is OS specific
-- Found herre: https://download.eclipse.org/jdtls/snapshots/
local eclipseLauncher =
    vim.fn.glob(os.getenv("HOME") ..
    "/langs_and_lang_tools/jdtls/plugins/org.eclipse.equinox.launcher_*.jar")

local function getJDTLSConfig()
  if osType == "Darwin" then
    return os.getenv("HOME") .. "/langs_and_lang_tools/jdtls/config_mac"
  else
    return os.getenv("HOME") .. "/langs_and_lang_tools/jdtls/config_linux"
  end
end

local root_dir = require('jdtls.setup').find_root({ '.git', 'mvnw', 'gradlew' })
local workspace_folder = os.getenv("HOME") .. "/workspace" .. vim.fn.fnamemodify(root_dir, ":p:h:t")
local jdtls_cmd = {
  'java',
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

local jdtls_settings = {
  java = {
    enabled = true,
  }
}

local function config(capabilities, onAttach)
  require('lspconfig')['jdtls'].setup {
    cmd = jdtls_cmd,
    on_attach = onAttach,
    capabilities = capabilities,
    settings = jdtls_settings
  }
end

return config
