local status, telescope = pcall(require, "telescope")
if (not status) then return end

local builtin = require('telescope.builtin')
local fb_actions = require'telescope._extensions.file_browser.actions'

telescope.setup {
	extensions = {
		["ui-select"] = {
			require"telescope.themes".get_dropdown()
		},
		fzf = {
			fuzzy = true,
		},
		file_browser = {
			mappings = {
				["n"] = {
					["a"] = fb_actions.create,
				}
			}
		}
	}
}

telescope.load_extension('ui-select')
telescope.load_extension('fzf')
telescope.load_extension('file_browser')

vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>ls', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>fd', builtin.diagnostics, {})
vim.keymap.set('n', '<leader>fb', '<Cmd>Telescope file_browser<CR>', {noremap = true})
