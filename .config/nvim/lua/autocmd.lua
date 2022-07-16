local autocmd = vim.api.nvim_create_autocmd

-- Ibus typing
local ibus_cur = "xkb:us::eng"
autocmd("InsertEnter", {
	pattern = { "*.tex", "*.md" },
	callback = function()
		os.execute("ibus engine " .. ibus_cur)
	end,
})
autocmd("InsertLeave", {
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

autocmd("FileType", {
	pattern = "tex",
	callback = function()
		vim.keymap.set("n", "<A-c>", ":VimtexCompile<CR>") -- "run code"
	end,
})

autocmd("FileType", {
	pattern = "haskell",
	callback = function()
		vim.keymap.set("n", "<A-c>", ':w | TermExec go_back=0 cmd=":l %"<CR>')
		vim.keymap.set("n", "<A-r>", ':TermExec go_back=0 cmd="runhaskell %"<CR>')
	end,
})

autocmd("User", {
	pattern = "PackerCompileDone",
	callback = function()
		vim.cmd "CatppuccinCompile"
	end,
})
