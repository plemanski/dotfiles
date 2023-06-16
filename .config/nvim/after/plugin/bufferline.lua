local status, bufferline = pcall(require, "bufferline")
if (not status) then return end

bufferline.setup({
	highlights = require("catppuccin.groups.integrations.bufferline").get(),
	options = {
		style_preset = bufferline.style_preset.minimal,
		diagnostics = "nvim_lsp",
	}
})
