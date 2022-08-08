local autocmd = vim.api.nvim_create_autocmd

-- packer
local packer = vim.api.nvim_create_augroup("UserPacker", { clear = true })
autocmd("BufWritePost", {
	group = packer,
	pattern = "*.lua",
	callback = function()
		vim.defer_fn(function()
			if vim.fn.expand("%:p"):match(vim.fn.resolve(vim.fn.stdpath "config")) then vim.api.nvim_command "silent source | PackerCompile" end
		end, 0)
	end,
})

autocmd("User", {
	group = packer,
	pattern = "PackerCompileDone",
	callback = function() -- Autocompile colorscheme
		require("catppuccin").compile()
		vim.api.nvim_command "colorscheme catppuccin"
		vim.defer_fn(function() vim.api.nvim_command "Restart" end, 0)
	end,
})

-- ibus
local ibus_cur = "xkb:us::eng"

local ibus = vim.api.nvim_create_augroup("UserIbus", { clear = true })
autocmd("InsertEnter", {
	group = ibus,
	pattern = { "*.tex", "*.md" },
	callback = function() os.execute("ibus engine " .. ibus_cur) end,
})

autocmd("InsertLeave", {
	group = ibus,
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
