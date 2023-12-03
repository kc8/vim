vim.cmd [[packadd packer.nvim]]
-- The following is for a custom plugin and WIP
--local keymapper = require("vim.init-config.keymapper")
--local nnoremap = keymapper.nnoremap
--nnoremap("<Leader>r", function()
    --require('sql-nvim.sql-nvim').toggle_menu()
--end)
--nnoremap("<Leader>t", function()
    --require('sql-nvim.sql-nvim').run_sql_statement()
--end)

PackerReinstall = function(name) -- usage example => :lua PackerReinstall "yaml.nvim"
	if package.loaded["packer"] == nil then
		print("Packer not installed or not loaded")
	end

	local utils = require("packer.plugin_utils")
	local suffix = "/" .. name

	local opt, start = utils.list_installed_plugins()
	for _, group in pairs({ opt, start }) do
		if group ~= nil then
			for dir, _ in pairs(group) do
				if dir:sub(-string.len(suffix)) == suffix then
					vim.ui.input({ prompt = "Remove " .. dir .. "? [y/n] " }, function(confirmation)
						if string.lower(confirmation) ~= "y" then
							return
						end
						vim.cmd("!rm -rf " .. dir)
						vim.cmd(":PackerSync")
					end)
					return
				end
			end
		end
	end
end

return require('packer').startup(function()
    -- Color scheme
    -- luacheck: push ignore use
    use('morhetz/gruvbox')
    use('sainnhe/sonokai')
    use('rose-pine/neovim')

    --Omnisharp is for C#
    --use('OmniSharp/omnisharp-vim')
    --use('nickspoons/vim-sharpenup')

    use { 'neovim/nvim-lspconfig' }
    -- NOTE/TODO this is now built into nvim 0.9+
    -- so... at somepoint we can remove
    use('editorconfig/editorconfig-vim')

    --Git
    use('tpope/vim-fugitive')
    --Git What branch am I in?
    use('vim-airline/vim-airline')
    -- git in the gutter!
    use('airblade/vim-gitgutter')
    -- :GBrowse function
    use('tpope/vim-rhubarb')

    use('mbbill/undotree')
    -- TODO/NOTE replaced with treesiter/lsp. Need to see where I am not using this
    -- use('sheerun/vim-polyglot')

    -- NOTE this uses a specific branch
    -- To get ripgrep working, we need to install rg
    -- and add it to our path. Instructions are on their
    -- git repo
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.x',
        requires = {
            { 'nvim-lua/plenary.nvim' },
            { 'BurntSushi/ripgrep' }
        }
    }

    -- Packer needs to know where it is to prevent it from removing
    -- itself...
    -- Source https://github.com/wbthomason/packer.nvim/issues/718
    use { 'wbthomason/packer.nvim' }

    -- auto completion, settings aree in lspconfig.nvim.lua
    use {
        'hrsh7th/nvim-cmp',
        requires = {
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-vsnip' },
            { 'hrsh7th/vim-vsnip' },
        }
    }

    -- Scala lsp
    use {
        'scalameta/nvim-metals',
        requires = {
            { 'nvim-lua/plenary.nvim' },
            { 'mfussenegger/nvim-dap' },
        }
    }
    -- Adds some nice-to-haves to built in lsp
    -- NOTE: there might be a performance issue in here
    --use({
    --"glepnir/lspsaga.nvim",
    --config = function()
    --require('lspsaga').setup({})
    --end,
        --"glepnir/lspsaga.nvim",
        --config = function()
            --require('lspsaga').setup({})
        --end,

    -- plenary is a dep for other plugins
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

    use { 'nvim-treesitter/playground' }

    use("simrat39/rust-tools.nvim")

    -- rust loading indicator
    use({
        "j-hui/fidget.nvim",
        tag = 'legacy',
    })

    use({ "nvim-treesitter/nvim-treesitter-context" })

    use({ 'mfussenegger/nvim-jdtls' })
    --use({
    --'/home/kyle/projects/sql-nvim/'
    --}
    -- luacheck: pop
end)
