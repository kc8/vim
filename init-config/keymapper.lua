local keyMapper = {} 

local function mapperFunction(operation, defaultOperations) 
    defaultOperations = defaultOperations or {noremap = true} 
    return function(lhs, rhs, opts)
        opts = vim.tbl_extend("force", defaultOperations, opts or {})
        vim.keymap.set(operation, lhs, rhs, opts)
    end
end

-- example replacement nnoremap <silent> <C-f> :Rg 
keyMapper.nnoremap = mapperFunction("n") --nnoremap
return keyMapper
