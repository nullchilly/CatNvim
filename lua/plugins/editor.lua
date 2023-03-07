return {
	{
		"nvim-tree/nvim-tree.lua",
		cmd = { "NvimTreeToggle", "NvimTreeFocus" },
		opts = {
			disable_netrw = true,
			hijack_netrw = true,
			open_on_tab = false,
			hijack_cursor = true,
			hijack_unnamed_buffer_when_opening = false,
			update_cwd = true,
			update_focused_file = {
				enable = true,
				update_cwd = false,
			},
			sync_root_with_cwd = true,
			view = {
				-- width = 20,
				hide_root_folder = false,
			},
			git = {
				enable = false,
				ignore = true,
			},
			actions = {
				open_file = {
					resize_window = true,
				},
			},
			renderer = {
				indent_markers = {
					enable = false,
				},
			},
		},
	},
	{
		"akinsho/toggleterm.nvim",
		cmd = { "ToggleTerm", "TermExec" },
		config = function()
			require("toggleterm").setup({
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
			})

			vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "BufWinEnter", "WinEnter" }, {
				pattern = "term://*",
				callback = function()
					vim.api.nvim_command("startinsert")
				end,
			})
		end,
	},
}
