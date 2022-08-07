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
require("lspconfig").sumneko_lua.setup(require("lua-dev").setup {})

-- latex
require("lspconfig").texlab.setup {}

-- haskell
require("lspconfig").hls.setup {}

-- python
require("lspconfig").pyright.setup {}
