return {
	{
		"NeogitOrg/neogit",
		opts = {},
	},
	{
		"neovim/nvim-lspconfig",
		opts = {
			inlay_hints = { enabled = true },
			servers = {
				pylance = {
					settings = {
						python = {
							analysis = {
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
}
