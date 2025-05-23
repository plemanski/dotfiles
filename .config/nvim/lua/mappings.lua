local map = require 'utils'.map
vim.g.mapleader = ','
-- Plugin Specific Mappings
-- Obsidian Nvim Mappings
map("n", "<Leader>os", ":ObsidianSearch<CR>")
map("v", "<Leader>on", ":ObsidianLinkNew<CR>")
map("n", "<Leader>on", ":ObsidianNew<SPACE>")
map("v", "<Leader>ol", ":ObsidianLink<CR>")

-- Nvim Tree
map("n", "<Leader>tt", ":NvimTreeToggle<CR>")

-- Navigation
map("n", "<Leader>]", "gt")
map("n", "<Leader>[", "gT")

-- JQ
-----Format Whole Buffer
map("n", "<Leader>fj", "<Cmd>%!jq<CR>")
-----Format Visual Select
map("v", "<Leader>fj", ":'<,'>!jq<CR>")
