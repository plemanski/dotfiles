local fugitive_status, fugitive = pcall(require, 'fugitive')
local sign_status, gitsigns = pcall(require, 'gitsigns')

if (not fugitive_status and not sign_status) then return end

require('gitsigns').setup()
