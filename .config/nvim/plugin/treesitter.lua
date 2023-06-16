require'nvim-treesitter.configs'.setup{
	highlight = {
		enable = true,
		disable = {},
	},
	indent = {
		enable = true,
		disable = {},
	},
	ensure_installed = {
		"lua",
		"bash",
		"javascript",
		"typescript",
		"html",
		"css",
		"json",
		"markdown",
		"markdown_inline",
		"java",
		"rust"
	},
}
