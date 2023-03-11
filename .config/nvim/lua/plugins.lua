return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'

-- Mason: For downloading LSP, DAP, etc packages
    use {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",
    }

    use {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/nvim-cmp",
        "hrsh7th/cmp-vsnip",
        "hrsh7th/vim-vsnip"
    }
    
    use {
        "mfussenegger/nvim-jdtls"
    }

    use 'mfussenegger/nvim-dap'

    use 'nvim-lua/lsp-status.nvim'

    --Null-LS for linking LSP features to treesitter and nvim lsp
    use {
        'jose-elias-alvarez/null-ls.nvim',
        cond=function()
            local file_name = vim.cmd("file")
            return string.match(file_name, "theme.js")
        end
    }
    -- QoL - default remap <ESC> to <J><K>
    use {'jdhao/better-escape.vim', event = 'InsertEnter'}

    -- Use base-16 colours in nvim. Required to match terminal colours
    use 'chriskempson/base16-vim'

    -- Fuzzyfinding
    use ({
        'nvim-telescope/telescope.nvim', tag='0.1.0', 
        requires = {{'nvim-lua/plenary.nvim'}}
    })
    use {'nvim-telescope/telescope-ui-select.nvim' }

    -- Highlight keywords in file on hover
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

    --Git wrapper
    use 'tpope/vim-fugitive'

    --Better file explorer
    use {
      'nvim-tree/nvim-tree.lua',
      requires = {
        'nvim-tree/nvim-web-devicons', -- optional, for file icons
      },
      tag = 'nightly' -- optional, updated every week. (see issue #1193)
    }

    -- More netRW improvements. Not sure if I like this one yet.
    use 'tpope/vim-vinegar'

    --Pretty and more performant statys bar
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }
    use "lukas-reineke/indent-blankline.nvim"
    --Rose-pine needs no intro 
    --S O H O  V I B E S
    use({
        'rose-pine/neovim',
        as = 'rose-pine',
        config = function()
            vim.cmd('colorscheme rose-pine')
        end
    })
    use 'glepnir/dashboard-nvim'
end)
