return {
	{
		"nvim-lualine/lualine.nvim",
		lazy = true,
		config = function() require("lualine").setup() end,
	},
	{
		"feline-nvim/feline.nvim",
		config = function()
			require("feline").setup {
				components = require("catppuccin.groups.integrations.feline").get(),
			}
			vim.api.nvim_create_autocmd("ColorScheme", {
				pattern = "*",
				callback = function()
					package.loaded["feline"] = nil
					package.loaded["catppuccin.groups.integrations.feline"] = nil
					require("feline").setup {
						components = require("catppuccin.groups.integrations.feline").get(),
					}
				end,
			})
		end,
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		config = function()
			require("indent_blankline").setup {
				char = "▏",
				char_blankline = " ",
				filetype_exclude = { "help", "terminal", "lspinfo", "TelescopePrompt", "TelescopeResults" },
				buftype_exclude = { "terminal" },
				show_first_indent_level = false,
			}
		end,
	},
	{
		"akinsho/toggleterm.nvim",
		cmd = { "ToggleTerm", "TermExec" },
		config = function()
			require("toggleterm").setup {
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
		end,
	},
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup {
				signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
				numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
				linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
				word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
				watch_gitdir = {
					interval = 1000,
					follow_files = true,
				},
				attach_to_untracked = true,
				current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
				current_line_blame_opts = {
					virt_text = true,
					virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
					delay = 1000,
				},
				current_line_blame_formatter_opts = {
					relative_time = false,
				},
				sign_priority = 0,
				update_debounce = 100,
				status_formatter = nil, -- Use default
				max_file_length = 40000,
				preview_config = {
					-- Options passed to nvim_open_win
					border = "single",
					style = "minimal",
					relative = "cursor",
					row = 0,
					col = 1,
				},
				yadm = {
					enable = false,
				},
			}
		end,
		lazy = true,
		init = function()
			if vim.fn.isdirectory ".git" ~= 0 then require("lazy").load { plugins = "gitsigns.nvim" } end
		end,
	},
}
