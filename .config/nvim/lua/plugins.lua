return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'
	-- Appearance Plugins
	use { 'catppuccin/nvim', as = 'catppuccin' }
	use 'nvim-lualine/lualine.nvim'
	use 'akinsho/bufferline.nvim'
	-- QoL Plugins
	use {
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate'
	}
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.1',
		requires = { { 'nvim-lua/plenary.nvim' } }
	}
	use {
		'nvim-telescope/telescope-fzf-native.nvim',
		run =
		'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
	}
	use 'nvim-telescope/telescope-file-browser.nvim'
	use 'nvim-telescope/telescope-ui-select.nvim'
	use { 'nvim-tree/nvim-tree.lua',
		requires = { { 'nvim-tree/nvim-web-devicons' } }
	}
	use { 'nvim-zh/better-escape.vim', event = 'InsertEnter' }
	use { 'epwalsh/obsidian.nvim' }
	-- LSP Related Plugins
	use { 'neovim/nvim-lspconfig' }
	use { 'rcarriga/nvim-dap-ui', requires = { 'mfussenegger/nvim-dap' } }
	use {
		'williamboman/mason.nvim',
		run = ':MasonUpdate' -- :MasonUpdate updates registry contents
	}
	use 'jose-elias-alvarez/null-ls.nvim'
	use 'williamboman/mason-lspconfig.nvim'
	use 'nvimdev/lspsaga.nvim'
	use {'folke/trouble.nvim',
		requires={'nvim-tree/nvim-web-devicons'}
		}
	use 'ray-x/lsp_signature.nvim'
	--Filetype specific Plugins
	use 'jose-elias-alvarez/typescript.nvim'
	use 'chrisbra/csv.vim'
	use 'mfussenegger/nvim-jdtls'

	-- Snippets and Auto completion
	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/nvim-cmp'
	use 'onsails/lspkind-nvim'
	use 'L3MON4D3/LuaSnip'
end)
