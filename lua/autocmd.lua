local autocmd = vim.api.nvim_create_autocmd

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
