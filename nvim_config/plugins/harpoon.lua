return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  config = function()
    local harpoon = require("harpoon")
    harpoon:setup()
    local keymapper = require("vim.keymapper")
    local nnoremap = keymapper.nnoremap
    nnoremap("<Leader><tab>", function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end)

    nnoremap("<tab>", function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end)

    nnoremap("<Leader>0", function()
      require('harpoon.ui').nav_next()
    end)

    nnoremap("<Leader>9", function()
      require('harpoon.ui').nav_prev()
    end)

    nnoremap("<Leader>m", function()
      harpoon:list():append()
    end)

    local function conCatString(a, b)
      return string.format("%s%s", a, b)
    end

    for i = 1, 4, 1 do
      nnoremap(conCatString("<Leader>", tostring(i)),
        function()
          harpoon:list():select(i)
        end)
    end
  end
}
