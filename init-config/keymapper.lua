local keyMapper = {} 

local function mapperFunction(operationType) 
    opts = {noremap = true}
    return function(lhs, rhs)
        vim.keymap.set(operationType, lhs, rhs, opts)
    end
end

-- example replacement nnoremap <silent> <C-f> :Rg 
keyMapper.nnoremap = mapperFunction("n") --nnoremap
return keyMapper
