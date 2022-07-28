-- install gopls from git -> add to path (usually 
-- export=$export:~/go/bin (or other dir)
require'lspconfig'.gopls.setup{
    on_attach = function() 
    vim.keymap.set("n", "K", vim.lsp.buf.hover, {buffer=0})
    end,
}
