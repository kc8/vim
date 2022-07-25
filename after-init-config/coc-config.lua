--TODO break this out into lua or find another way to source this 
thisDir = os.getenv("PWD") .. "/after-init-config/"
-- print(thisDir)
vim.cmd('source' ..thisDir .. '/coc-config.vim')
