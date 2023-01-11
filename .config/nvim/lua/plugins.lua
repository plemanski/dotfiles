return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'

    use {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",
    }
    use {'jdhao/better-escape.vim', event = 'InsertEnter'}

    use 'jose-elias-alvarez/null-ls.nvim'

    use 'chriskempson/base16-vim'

    use ({
        'nvim-telescope/telescope.nvim', tag='0.1.0', 
        requires = {{'nvim-lua/plenary.nvim'}}
    })

    use "RRethy/vim-illuminate"


    use ({
        'nvim-treesitter/nvim-treesitter',
        run = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end,
    })

    use 'gelguy/wilder.nvim'

    use 'nvim-tree/nvim-web-devicons'

    use {
      'nvim-tree/nvim-tree.lua',
      requires = {
        'nvim-tree/nvim-web-devicons', -- optional, for file icons
      },
      tag = 'nightly' -- optional, updated every week. (see issue #1193)
    }

    use 'tpope/vim-vinegar'

    use({
        'rose-pine/neovim',
        as = 'rose-pine',
        config = function()
            vim.cmd('colorscheme rose-pine')
        end
    })
end)
