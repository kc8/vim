local keymapper = require("vim.init-config.keymapper")
local nnoremap = keymapper.nnoremap

local actions = require('telescope.actions')
local telescope = require('telescope')

nnoremap("<C-p>", function() 
    require('telescope.builtin').find_files()    
end) 

nnoremap("<C-g>", function() 
    require('telescope.builtin').git_files()    
end) 

nnoremap("<C-o>", function() 
    require('telescope.builtin').buffers()    
end) 

nnoremap("<C-j>", function() 
    require('telescope.actions').cycle_previewers_next()
end) 

nnoremap("<C-k>", function() 
    require('telescope.builtin').buffers()    
end) 


telescope.setup({
    defaults = {
        mappings = {
            i = { 
              ["<C-j>"] = actions.move_selection_next,
              ["<C-k>"] = actions.move_selection_previous,
            },
        },
    },
})