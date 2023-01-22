vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
    -- Color scheme     
    use('morhetz/gruvbox')

    --Omnisharp is for C#
    use('OmniSharp/omnisharp-vim')
    use('nickspoons/vim-sharpenup')

    -- Fuzzy finder for recursive file searching
    --use('junegunn/fzf') --NOTE this needs to be installed
    --use('junegunn/fzf.vim')

    -- use { 'neoclide/coc.nvim', branch ='release' }

    use {'neovim/nvim-lspconfig'}

    use('editorconfig/editorconfig-vim')

    --Git 
    use('tpope/vim-fugitive')
    --Git What branch am I in?
    use('vim-airline/vim-airline')
    -- git in the gutter!
    use('airblade/vim-gitgutter')
    use('tpope/vim-rhubarb')

    use('mbbill/undotree')
    use('sheerun/vim-polyglot')

    -- use('kc8/first_vim_plugin')
    
    -- NOTE this uses a specific branch
    -- To get ripgrep working, we need to install rg 
    -- and add it to our path. Instructions are on their 
    -- git repo
    use {
      'nvim-telescope/telescope.nvim', tag = '0.1.0',
      requires = { 
          {'nvim-lua/plenary.nvim'},
          {'BurntSushi/ripgrep'}
      }
    }

    -- Packer needs to know where it is to prevent it from removing 
    -- itself...
    -- Source https://github.com/wbthomason/packer.nvim/issues/718
    use {'wbthomason/packer.nvim'}
 
    -- auto completion, settings aree in lspconfig.nvim.lua
    use {
            'hrsh7th/nvim-cmp',
            requires = { 
                { 'hrsh7th/cmp-nvim-lsp' },
                { 'hrsh7th/cmp-vsnip' },
                { 'hrsh7th/vim-vsnip' },
            }
        }

    use {
            'scalameta/nvim-metals',
            requires = { 
                { 'nvim-lua/plenary.nvim' },
                { 'mfussenegger/nvim-dap' },
            }
        }

    use {'nvim-lua/plenary.nvim'}

    -- Adds some nice-to-haves to built in lsp 
    use({
        "glepnir/lspsaga.nvim",
        config = function() 
            require('lspsaga').setup({})
        end,
    })

    use { 'nvim-lua/plenary.nvim' }
    use { 'ThePrimeagen/harpoon' }

    use { 'ziglang/zig.vim' }

    use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
             local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
             ts_update()
         end,
     }

     use { 'nvim-treesitter/playground'}
end)
