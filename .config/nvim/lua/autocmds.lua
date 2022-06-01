local autocmd = vim.api.nvim_create_autocmd
-- Disable statusline in alpha
autocmd("FileType", {
	pattern = "alpha",
	callback = function()
		vim.opt.laststatus = 0
	end,
})

autocmd("BufUnload", {
	buffer = 0,
	callback = function()
		vim.opt.laststatus = 3
	end,
})

autocmd("TermOpen", {
	callback = function()
		vim.o.number = false
		vim.o.relativenumber = false
		vim.cmd "startinsert"
	end,
})

-- Ibus typing
local ibus_cur = "xkb:us::eng"
vim.api.nvim_create_autocmd("InsertEnter", {
	pattern = { "*.tex", "*.md" },
	callback = function()
		os.execute("ibus engine " .. ibus_cur)
	end,
})
vim.api.nvim_create_autocmd("InsertLeave", {
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
