local autocmd = vim.api.nvim_create_autocmd

autocmd("User", {
	pattern = "PackerCompileDone",
	callback = function()
		require("catppuccin").compile()
		vim.defer_fn(function() vim.api.nvim_command "colorscheme catppuccin" end, 0)
	end,
})

-- autocmd("BufWritePost", {
-- 	pattern = "*.lua",
-- 	callback = function()
-- 		vim.defer_fn(function()
-- 			if vim.fn.expand("%:p"):match(vim.fn.resolve(vim.fn.stdpath "config")) then vim.api.nvim_command "silent source | PackerCompile" end
-- 		end, 0)
-- 	end,
-- })
