lua require('plugins')
lua require('config.nvimtree')

lua require('mason').setup()

lua require('config.nvim-treesitter')

"lua require('config.telescope')

lua require('config.lualine')
lua require('config.dashboard')

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

let mapleader = ","

set clipboard+=unnamedplus

set autochdir
"Toggle the NvimTree
nnoremap <leader>tt <cmd>NvimTreeToggle<cr>

"Telescope bindings
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

