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

    use { 
        'neoclide/coc.nvim', branch ='release'
    }

    use {'neovim/nvim-lspconfig'}

    use('editorconfig/editorconfig-vim')

    --Git 
    use('tpope/vim-fugitive')
    --Git What branch am I in?
    use('vim-airline/vim-airline')

    use('mbbill/undotree')
    use('sheerun/vim-polyglot')

    -- use('kc8/first_vim_plugin')
    
    -- NOTE this uses a specific branch
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

end)
