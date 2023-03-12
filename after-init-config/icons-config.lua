-- requires the tserber installed and on path
--
local icons = require('nvim-web-devicons')

require'nvim-web-devicons'.setup {
    color_icons= true; 
    default = true;
}

-- Get all possible icons
icons.get_icons()
