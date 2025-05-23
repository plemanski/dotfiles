local status, bufferline = pcall(require, "bufferline")
if (not status) then return end

bufferline.setup({
	options = {
		themable = true,
		style_preset = bufferline.style_preset.minimal,
		diagnostics = "nvim_lsp",
	}
})
