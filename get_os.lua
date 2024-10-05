local getOSSettings = {}

-- TODO there is a bug in the windows result
local function getVimConfigDir()
    local home = os.getenv("HOME")
    local windowsResult = "~/AppData/Local/nvim/lua/vim/"
    if home ~= nil then
        return home
    else
        return windowsResult
    end
end

-- Linux returns Linux
-- Darwin return max
local function getOSType()
  local mac = "Darwin"
  local linux = "Linux"

  local osType = vim.loop.os_uname().sysname
  if osType == mac then
    return "Mac"
  elseif osType == linux then
    return "Linux"
  end

  return "OS_UNDEFINED"
end

getOSSettings.getVimConfigDir = getVimConfigDir()
getOSSettings.getOS = getOSType()

return getOSSettings
