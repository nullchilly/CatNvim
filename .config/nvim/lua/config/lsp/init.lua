vim.diagnostic.config {
	virtual_text = false,
}

local servers = {"cpp", "lua", "tex"}

for _, lsp in pairs(servers) do
	require("config.lsp." .. lsp)
end
