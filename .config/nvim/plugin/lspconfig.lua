require("mason").setup()

local status, lspconfig = pcall(require, 'lspconfig')
if (not status) then return end

local protocol = require('vim.lsp.protocol')

local augroup_format = vim.api.nvim_create_augroup("Format", { clear = true })
local enable_format_on_save = function(_, bufnr)
	vim.api.nvim_clear_autocmds({ group = augroup_format, buffer = bufnr })
	vim.api.nvim_create_autocmd("BufWritePre", {
		group = augroup_format,
		buffer = bufnr,
		callback = function()
			vim.lsp.buf.format({ bufnr = bufnr })
		end,
	})
end


local saga = require('lspsaga')
saga.setup({
	ui = {
		kind = require("catppuccin.groups.integrations.lsp_saga").custom_kind(),
		border = 'rounded',
	}
})


-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
	group = vim.api.nvim_create_augroup('UserLspConfig', {}),
	callback = function(ev)
		require'lsp_signature'.on_attach({
			bind = true,
			handler_opts = {
				border = 'rounded'
			}
		}, ev.buf)
		local opts = { buffer = ev.buf }
		vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
		vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
		vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
		vim.keymap.set('n', '<space>wl', function()
			print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
		end, opts)
		vim.keymap.set('n', '<space>f', function()
			vim.lsp.buf.format { async = true }
		end, opts)

		-- Buffer local mappings with LspSaga
		vim.keymap.set('n', 'K', '<Cmd>Lspsaga hover_doc<CR>', opts)
		vim.keymap.set('n', '<Leader>ca', '<Cmd>Lspsaga code_action<CR>', opts)
		vim.keymap.set('n', '<leader>pt', '<Cmd>Lspsaga peek_type_definition<CR>', opts)
		vim.keymap.set('n', 'gt', '<Cmd>Lspsaga goto_type_defintion<CR>', opts)
		vim.keymap.set('n', '<leader>pd', '<Cmd>Lspsaga peek_definition<CR>', opts)
		vim.keymap.set('n', 'gd', '<Cmd>Lspsaga goto_definition<CR>', opts)
		vim.keymap.set('n', 'gi', '<Cmd>Lspsaga lsp_finder<CR>', opts)
		vim.keymap.set('n', '<Leader>rn', '<Cmd>Lspsaga rename ++project<CR>', opts)
	end,
})

-- Set up completion with nvim_cmp
local capabilities = require 'cmp_nvim_lsp'.default_capabilities()

-- Server-specific settings. See `:help lspconfig-setup`
lspconfig.lua_ls.setup {
	capabilities = capabilities,
	settings = {
		Lua = {
			runtime = {
				-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
				version = 'LuaJIT',
			},
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = { 'vim' },
			},
			workspace = {
				-- Make the server aware of Neovim runtime files
				library = vim.api.nvim_get_runtime_file("", true),
				checkThirdParty = false,
			},
			-- Do not send telemetry data containing a randomized but unique identifier
			telemetry = {
				enable = false,
			},
		},
	},
}
lspconfig.rust_analyzer.setup{
	capabilities = capabilities,
}
lspconfig.bashls.setup{
	capabilities = capabilities,
}

require('typescript').setup({
	disable_commands = true,
	go_to_source_definition = {
		fallback = true,
	},
	server = {
		filetypes = { "typescript", "javascript" },
		capabilities = capabilities,
	}
})

local null_ls = require 'null-ls'

null_ls.setup({
	sources = {
		require("typescript.extensions.null-ls.code-actions"),
		null_ls.builtins.diagnostics.shellcheck,
	},
})
