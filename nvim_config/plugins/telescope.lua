-- local finders = require "telescope.finders"
--local make_entry = require "telescope.make_entry"
--local pickers = require "telescope.pickers"
--local conf = require("telescope.config").values

-- NOTES: add telescope ersults into quick fix list with : n, <c-q>
local telescoprConfig = {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.8',
  requires = {
    { 'nvim-lua/plenary.nvim' },
    { 'BurntSushi/ripgrep' }
  },
  config = function()
    local actions = require('telescope.actions')
    local telescope = require('telescope')
    local teleBuiltIn = require('telescope.builtin')

    telescope.setup({
      defaults = {
        extensions = {
          fzf = {}
        },
        pickers = {
          find_files = {
            theme = "ivy"
          }
        },
        mappings = {
          i = {
            ["<C-j>"] = actions.move_selection_next,
            ["<C-k>"] = actions.move_selection_previous,
          },
          n = {
            ["f"] = actions.send_to_qflist,
          }
        },
        file_ignore_patterns = { "target", "node_modules", "parser.c" },
      },
    })

    vim.keymap.set('n', "<C-p>", function()
      teleBuiltIn.find_files({ hidden = true })
    end)

    vim.keymap.set('n', "<C-o>", function()
      require('telescope.builtin').buffers()
    end)

    vim.keymap.set('n', "<C-g>", function()
      teleBuiltIn.git_files()
    end)

    vim.keymap.set('n', "<C-o>", function()
      require('telescope.builtin').buffers()
    end)

    vim.keymap.set('n', "<C-j>", function()
      require('telescope.actions').cycle_previewers_next()
    end)

    vim.keymap.set('n', "<C-k>", function()
      require('telescope.builtin').buffers()
    end)

    vim.keymap.set('n', "<C-h>", function()
      require('telescope.builtin').help_tags()
    end)
    --vim.keymap.set('n', "<C-x>", liveSearchWithExpression)
    vim.keymap.set('n', "<Leader>lg", function()
      require('telescope.builtin').live_grep({ hidden = true })
    end)

    -- TODO if metals is not installed, this will break
    --vim.keymap.set("n", "<leader>mc",
    -- require('telescope').extensions.metals.commands)
  end
}

return telescoprConfig
