return {
	{ "lambdalisue/suda.vim", cmd = { "SudaRead", "SudaWrite" } },
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
				preserve_window_proportions = true,
				-- width = 20,
				-- hide_root_folder = false,
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
	{
		"nvim-telescope/telescope.nvim",
		opts = {
			defaults = {
				vimgrep_arguments = {
					"rg",
					"--no-heading",
					"--with-filename",
					"--line-number",
					"--column",
					"--smart-case",
				},
				initial_mode = "insert",
				-- prompt_prefix = " " .. icons.ui.Telescope .. " ",
				-- selection_caret = icons.ui.ChevronRight,
				scroll_strategy = "limit",
				results_title = false,
				layout_strategy = "horizontal",
				path_display = { "absolute" },
				selection_strategy = "reset",
				sorting_strategy = "ascending",
				color_devicons = true,
				file_ignore_patterns = { ".git/", ".cache", "build/", "%.class", "%.pdf", "%.mkv", "%.mp4", "%.zip" },
				layout_config = {
					horizontal = {
						prompt_position = "top",
						preview_width = 0.55,
						results_width = 0.8,
					},
					vertical = {
						mirror = false,
					},
					width = 0.85,
					height = 0.92,
					preview_cutoff = 120,
				},
				file_previewer = require("telescope.previewers").vim_buffer_cat.new,
				grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
				qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
				file_sorter = require("telescope.sorters").get_fuzzy_file,
				generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
				buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
			},
		},
	},
	{
		"folke/flash.nvim",
		enabled = false,
	},
}
