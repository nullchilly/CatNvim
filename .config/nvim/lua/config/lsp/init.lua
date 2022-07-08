-- vim.diagnostic.config {
-- 	virtual_text = false,
-- }

require("lspconfig").bashls.setup {}

-- cpp
require("lspconfig").clangd.setup {
	capabilities = {
		offsetEncoding = "utf-8",
	},
}

-- lua
require("lspconfig").sumneko_lua.setup {
	settings = {
		Lua = {
			runtime = {
				version = "LuaJIT",
			},
			workspace = {
				-- Make the server aware of Neovim runtime files
				library = {
					["/usr/share/nvim/runtime/lua"] = true,
					["/usr/share/nvim/runtime/lua/lsp"] = true,
					["/usr/share/awesome/lib"] = true,
				},
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
