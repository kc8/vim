local getOSSettings = {}

local function getVimConfigDir() 
    local home = os.getenv("HOME")
    local unixResult = "~/.config/nvim/lua/vim/"
    local windowsResult = "~/AppData/Local/nvim/lua/vim/"
    if home ~= nil then 
        return unixResult 
    else 
        return windowsResult
    end
end

getOSSettings.getVimConfigDir = getVimConfigDir()

return getOSSettings 
