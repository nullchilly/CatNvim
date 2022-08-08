local autocmd = vim.api.nvim_create_autocmd

-- packer
local config_path = vim.fn.resolve(vim.fn.stdpath "config")

vim.api.nvim_create_augroup("Packer", { clear = true })

autocmd("BufWritePost", {
	group = "Packer",
	pattern = "*.lua",
	callback = function()
		if vim.fn.expand("%:p"):match(config_path) then vim.api.nvim_command "silent source | PackerCompile" end
	end,
})

autocmd("User", {
	group = "Packer",
	pattern = "PackerCompileDone",
	callback = function()
		vim.g.loaded_telescope = 0
		require("catppuccin").compile()
		vim.defer_fn(function() vim.api.nvim_command "colorscheme catppuccin" end, 0)
	end,
})

-- ibus
local ibus_cur = "xkb:us::eng"

vim.api.nvim_create_augroup("Ibus", { clear = true })
autocmd("InsertEnter", {
	group = "Ibus",
	pattern = { "*.tex", "*.md" },
	callback = function() os.execute("ibus engine " .. ibus_cur) end,
})

autocmd("InsertLeave", {
	group = "Ibus",
	pattern = { "*.tex", "*.md" },
	callback = function()
		local f = io.popen("ibus engine", "r")
		if f then
			ibus_cur = f:read "*a"
			f:close()
		end
		os.execute "ibus engine xkb:us::eng"
	end,
})
