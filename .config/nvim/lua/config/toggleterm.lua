local present, toggleterm = pcall(require, "toggleterm")
if not present then return end

toggleterm.setup {
	size = function(term)
		if term.direction == "horizontal" then
			return 12
		elseif term.direction == "vertical" then
			return vim.o.columns * 0.4
		end
	end,
	hide_numbers = true,
	shade_filetypes = {},
	shade_terminals = true,
	shading_factor = "1",
	start_in_insert = true,
	insert_mappings = true,
	terminal_mappings = true,
	persist_size = true,
}

vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "BufWinEnter", "WinEnter" }, {
	pattern = "term://*",
	callback = function() vim.api.nvim_command "startinsert" end,
})
