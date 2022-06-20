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
