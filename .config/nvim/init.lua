vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
require('plugins')
require('mappings')
require('formatting')
vim.o.clipboard="unnamedplus"
vim.g.termguicolors = true
vim.cmd.colorscheme "catppuccin"
