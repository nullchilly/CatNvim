local autocmd = vim.api.nvim_create_autocmd

autocmd("FileType", {
	pattern = "haskell",
	callback = function()
		vim.keymap.set("n", "<A-c>", ':w | TermExec go_back=0 cmd=":l %"<CR>')
		vim.keymap.set("n", "<A-r>", ':TermExec go_back=0 cmd="runhaskell %"<CR>')
	end,
})

vim.defer_fn(function()
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
	autocmd("User", {
		pattern = "PackerCompileDone",
		callback = function()
			require("catppuccin").compile()
			vim.defer_fn(function()
				vim.cmd.colorscheme "catppuccin"
			end, 0)
		end,
	})

	autocmd("BufWritePost", {
		pattern = "*.lua",
		callback = function()
			vim.defer_fn(function()
				if vim.fn.expand("%:p"):match(vim.fn.resolve(vim.fn.stdpath "config")) then
					vim.cmd.PackerCompile()
				end
			end, 0)
		end,
	})
end, 0)
