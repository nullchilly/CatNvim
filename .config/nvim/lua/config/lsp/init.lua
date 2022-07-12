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
local root_files = {
  '.luarc.json',
  '.luacheckrc',
  '.stylua.toml',
  'stylua.toml',
  'selene.toml',
}
local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")
require("lspconfig").sumneko_lua.setup {
	root_dir = function(fname)
		local util = require 'lspconfig.util'
		return util.root_pattern(unpack(root_files))(fname) or util.find_git_ancestor(fname)
	end,
	settings = {
		Lua = {
			runtime = {
				version = "LuaJIT",
				-- Setup your lua path
        path = runtime_path,
			},
			workspace = {
				-- Make the server aware of Neovim runtime files
				library = vim.api.nvim_get_runtime_file('', true),
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
