lua require('plugins')
lua require('config.nvimtree')

lua require('mason').setup()
lua require('mason-lspconfig').setup()
lua require('config.null')

lua require('config.nvim-treesitter')

lua require('config.telescope')


set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
set copyindent

set number

set nowrap
set wildmenu
set showmatch

set smartcase

set foldenable

let mapleader=" "

set clipboard+=unnamedplus
