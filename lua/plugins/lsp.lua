return {
	{
		"neovim/nvim-lspconfig",
		config = function()
			-- vim.diagnostic.config {
			-- 	virtual_text = false,
			-- }

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
			-- require("lspconfig").texlab.setup {}

			-- haskell
			require("lspconfig").hls.setup {}

			-- python
			require("lspconfig").pyright.setup {}

			-- java
			require("lspconfig").java_language_server.setup {
				cmd = { "/usr/share/java/java-language-server/lang_server_linux.sh" },
			}

			-- tsx
			require("lspconfig").tsserver.setup {}

			-- require("lspconfig").ltex.setup {}
		end,
	},
	{
		"glepnir/lspsaga.nvim",
		config = function()
			require("lspsaga").setup {
				lightbulb = {
					enable = true,
					sign = true,
					sign_priority = 20,
					virtual_text = false,
				},
				ui = {
					-- currently only round theme
					theme = "round",
					-- border type can be single,double,rounded,solid,shadow.
					border = "solid",
					winblend = 0,
					expand = "",
					collapse = "",
					preview = " ",
					code_action = "",
					diagnostic = "🐞",
					incoming = " ",
					outgoing = " ",
					colors = require("catppuccin.groups.integrations.lsp_saga").custom_colors(),
					kind = require("catppuccin.groups.integrations.lsp_saga").custom_kind(),
				},
				rename_action_quit = "<C-c>",
				symbol_in_winbar = {
					enable = true,
					separator = " > ",
					show_file = true,
					folder_level = 1,
					color_mode = true,
				},
				server_filetype_map = {},
			}
		end,
	},
	{
		"jose-elias-alvarez/null-ls.nvim",
		config = function()
			local null_ls = require "null-ls"

			local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
			null_ls.setup {
				sources = {
					null_ls.builtins.formatting.stylua,
				},
				on_attach = function(client, bufnr)
					if client.supports_method "textDocument/formatting" then
						vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
						vim.api.nvim_create_autocmd("BufWritePre", {
							group = augroup,
							buffer = bufnr,
							callback = function() vim.lsp.buf.format { bufnr = bufnr } end,
						})
					end
				end,
			}
		end,
	},
}
