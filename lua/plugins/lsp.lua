return {
	{
		"NeogitOrg/neogit",
		opts = {},
	},
	{
		"neovim/nvim-lspconfig",
		opts = {
			-- inlay_hints = { enabled = true },
			servers = {
				pylance = {
					settings = {
						python = {
							analysis = {
								-- include = { "workspaceroot/**" },
								-- extraPaths = { vim.fn.getcwd() },
								inlayHints = {
									variableTypes = true,
									functionReturnTypes = true,
									callArgumentNames = true,
								},
							},
						},
					},
				},
				lua_ls = {},
				clangd = {},
				tsserver = {},
			},
		},
	},
	{
		"hinell/lsp-timeout.nvim",
		event = "LazyFile",
		dependencies = { "neovim/nvim-lspconfig" },
	},
}
