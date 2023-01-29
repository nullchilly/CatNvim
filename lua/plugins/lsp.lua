return {
	{
		"neovim/nvim-lspconfig",
		opts = {
			inlay_hints = { enabled = false },
			servers = {
				pylance = {
					settings = {
						python = {
							analysis = {
								diagnosticMode = "openFilesOnly",
								-- include = { "workspaceroot/**" },
								-- extraPaths = { vim.fn.getcwd() },
								inlayHints = {
									variableTypes = true,
									functionReturnTypes = true,
									callArgumentNames = true,
									pytestParameters = true,
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
