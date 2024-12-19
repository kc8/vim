local finders = require "telescope.finders"
local make_entry = require "telescope.make_entry"
local pickers = require "telescope.pickers"
local conf = require("telescope.config").values

local liveSearchWithExpression = function(opts)
  opts = opts or {}
  opts.cwd = opts.cwd or vim.uv.cwd()

  local customFinder = finders.new_async_job {
    command_generator = function(prompt)
      if not prompt or prompt == "" then
        return nil
      end
      local piecies = vim.split(prompt, "  ")
      local args = { "rg" }
      if piecies[1] then
        table.insert(args, "-e")
        table.insert(args, piecies[1])
      end

      if piecies[2] then
        table.insert(args, "-g")
        table.insert(args, piecies[2])
      end
      return vim.tbl_flatten {
        args,
        { "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
          "--smart-case"
        },
      }
    end,
    entry_maker = make_entry.gen_from_vimgrep(opts),
    cwd = opts.cwd,
  }

  pickers.new(opts, {
    debounce = 100,
    prompt_title = "RG Greps",
    finder = customFinder,
    previewer = conf.grep_previewer(opts),
    sorter = require("telescope.sorters").empty(),
  }):find()
end

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
    vim.keymap.set('n', "<C-x>", liveSearchWithExpression)
    vim.keymap.set('n', "<Leader>lg", function()
      require('telescope.builtin').live_grep({ hidden = true })
    end)

    -- TODO if metals is not installed, this will break
    --vim.keymap.set("n", "<leader>mc",
    -- require('telescope').extensions.metals.commands)
  end
}

return telescoprConfig
