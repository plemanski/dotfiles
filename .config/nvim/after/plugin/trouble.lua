local map = require'utils'.map
map('n','<Leader>xx', '<cmd>TroubleToggle<CR>')
map('v','<Leader>xx', '<cmd>TroubleToggle<CR>')
map('n', '<Leader>gR', '<cmd>TroubleToggle lsp_references<cr>')
