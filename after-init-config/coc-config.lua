-- TODO make this more robust, covnert the coc-config into lua or something else
function getCocConfigVimFile() 
    local home = os.getenv("HOME")
    local unixResult = "~/.config/nvim/lua/vim/after-init-config/"
    local windowsResult = "~/AppData/Local/nvim/lua/vim/after-init-config/"
    if home ~= nil then 
        return unixResult 
    else 
        return windowsResult
    end
end

thisDir = getCocConfigVimFile()
vim.cmd('source' ..thisDir .. 'coc-config.vim')
vim.cmd('source' ..thisDir .. 'c_sharp_config.vim')
