-- vim.diagnostic.config {
-- 	virtual_text = false,
-- }
vim.diagnostic.config {
	virtual_text = false,
	update_in_insert = true,
	underline = true,
	severity_sort = true,
	float = {
		focusable = true,
		style = "minimal",
		border = "rounded",
		source = "always",
		header = "",
		prefix = "",
	},
}

require("lspconfig").bashls.setup {}

-- cpp
require("lspconfig").clangd.setup {
	capabilities = {
		offsetEncoding = "utf-16",
	},
	args = {
		"--background-index",
		"-std=c++20",
		"--pch-storage=memory",
		"--clang-tidy",
		"--suggest-missing-includes",
	},
}

-- lua
local runtime_path = vim.split(package.path, ";")
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")
require("lspconfig").sumneko_lua.setup {
	settings = {
		Lua = {
			runtime = {
				version = "LuaJIT",
				-- Setup your lua path
				path = runtime_path,
			},
			workspace = {
				-- Make the server aware of Neovim runtime files
				library = vim.api.nvim_get_runtime_file("", true),
				checkThirdParty = false,
				maxPreload = 100000,
				preloadFileSize = 10000,
			},
			diagnostics = {
				globals = { "vim", "awesome", "client", "root", "tag", "screen", "mouse" },
			},
			telemetry = {
				enable = false,
			},
		},
	},
}

-- latex
require("lspconfig").texlab.setup {}

-- haskell
require("lspconfig").hls.setup {}

-- python
require("lspconfig").pyright.setup {}

-- java
require("lspconfig").java_language_server.setup {
	cmd = { "/usr/share/java/java-language-server/lang_server_linux.sh" },
}
