local home_dur = os.getenv("HOME")

local java_config = {
  cmd = {home_dir .. "/jdtls/bin/jdtls "},
  root_dir = '',
}
require('jdtls').start_or_attach(java_config)

