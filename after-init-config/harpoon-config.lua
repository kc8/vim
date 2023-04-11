local telescope = require('telescope')
telescope.load_extension('harpoon')

local keymapper = require("vim.init-config.keymapper")
local nnoremap = keymapper.nnoremap

nnoremap("<Leader><tab>", function()
  require('harpoon.ui').toggle_quick_menu()
end)

nnoremap("<tab>", function()
  require('harpoon.ui').toggle_quick_menu()
end)

nnoremap("<Leader>0", function()
  require('harpoon.ui').nav_next()
end)

nnoremap("<Leader>9", function()
  require('harpoon.ui').nav_prev()
end)

nnoremap("<Leader>m", function()
  require('harpoon.mark').add_file()
end)


local function conCatString(a, b)
  return string.format("%s%s", a, b)
end

-- NOTE harpoon starts its indexing at 1
for i = 1, 4, 1 do
  nnoremap(conCatString("<Leader>", tostring(i)), function()
    require('harpoon.ui').nav_file(i)
  end)
end
