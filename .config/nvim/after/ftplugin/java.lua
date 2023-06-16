local jdtls = require'jdtls'
local map = require'utils'.map

local root_markers = { '.git', 'gradlew', 'pom.xml' }
local root_dir = jdtls.setup.find_root(root_markers)
local home = os.getenv('HOME')
local workspace_folder = home .. "/.workspace/" .. vim.fn.fnamemodify(root_dir, ":p:h:t")
local jdtls_dir = home .. '/.eclipse/jdtls_1.9.0/'
local jar = jdtls_dir .. 'plugins/org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar'
local os = jit.os
local config_dir = jdtls_dir .. 'config_'
if (os == 'Linux') then
	config_dir = config_dir .. 'linux'
elseif (os == 'OSX') then
	config_dir = config_dir .. 'mac'
else
	config_dir = config_dir .. 'win'
end


-- See `:help vim.lsp.start_client` for an overview of the supported `config` options.
local config = {
	-- The command that starts the language server
	-- See: https://github.com/eclipse/eclipse.jdt.ls#running-from-the-command-line
	cmd = {

		'java', -- or '/path/to/java17_or_newer/bin/java'
		-- depends on if `java` is in your $PATH env variable and if it points to the right version.
		'-Declipse.application=org.eclipse.jdt.ls.core.id1',
		'-Dosgi.bundles.defaultStartLevel=4',
		'-Declipse.product=org.eclipse.jdt.ls.core.product',
		'-Dlog.protocol=true',
		'-Dlog.level=ALL',
		'-Xmx1g',
		'--add-modules=ALL-SYSTEM',
		'--add-opens', 'java.base/java.util=ALL-UNNAMED',
		'--add-opens', 'java.base/java.lang=ALL-UNNAMED',
		'-javaagent:'..home..'/.config/nvim/dependencies/lombok.jar',
		'-jar', jar,

		-- '-configuration', '/opt/homebrew/Cellar/jdtls/1.24.0/config_mac',
		'-configuration', config_dir,

		-- See `data directory configuration` section in the README
		'-data', workspace_folder
	},
	print(workspace_folder),
	-- This is the default if not provided, you can remove it. Or adjust as needed.
	-- One dedicated LSP server & client will be started per unique root_dir
	root_dir = root_dir,

	-- Here you can configure eclipse.jdt.ls specific settings
	-- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
	-- for a list of options
	settings = {
		java = {
			signatureHelp = { enabled = true },
			contentProvider = { preferred = 'fernflower' },
			completion = {
				favoriteStaticmembers = {
					"org.junit.jupiter.api.Assertions.*",
					"java.util.Objects.requireNonNull",
					"java.util.Objects.requireNonNullElse",
				}
			},
			sources = {
				organizeImports = {
					starThreshold = 9999,
					staticStarThreshold = 9999,
				}
			}
		}
	},

	-- Language server `initializationOptions`
	-- You need to extend the `bundles` with paths to jar files
	-- if you want to use additional eclipse.jdt.ls plugins.
	--
	-- See https://github.com/mfussenegger/nvim-jdtls#java-debug-installation
	--
	-- If you don't plan on using the debugger or other eclipse.jdt.ls plugins you can remove this
	init_options = {
		bundles = {
			-- Java Debug
				'/Users/peterlemanski/GitRepos/java-debug/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-*.jar',
			-- Java Test Runner
			vim.fn.glob('$HOME/GitRepos/vscode-java-test/server/*.jar', 1),
		}
	},
}

config.on_attach = function(client, bufnr)
	jdtls.setup_dap({ hotcodereplace = 'auto' })
	jdtls.setup.add_commands()
	-- Keymaps
	local opts = { silent = true, buffer = bufnr }
	map('n', '<A-o>', jdtls.organize_imports, opts)
	map('n', '<leader>tc', jdtls.test_class, opts)
	map('n', '<leader>tm', jdtls.test_nearest_method, opts)
end

-- This starts a new client & server,
-- or attaches to an existing client & server depending on the `root_dir`.
require('jdtls').start_or_attach(config)
