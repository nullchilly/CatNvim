local present, catppuccin = pcall(require, "catppuccin")
if not present then return end

catppuccin.setup {
	flavour = "mocha", -- latte, frappe, macchiato, mocha
	term_colors = true,
	transparent_background = false,
	styles = {
		comments = {},
		conditionals = {},
		loops = {},
		functions = {},
		keywords = {},
		strings = {},
		variables = {},
		numbers = {},
		booleans = {},
		properties = {},
		types = {},
	},
	color_overrides = {
		latte = {
			base = "#E1EEF5",
		},
		mocha = {
			base = "#000000",
		},
	},
	highlight_overrides = {
		latte = function(_)
			return {
				NvimTreeNormal = { bg = "#D1E5F0" },
			}
		end,
		mocha = function(mocha)
			return {
				TabLineSel = { bg = mocha.pink },
				NvimTreeNormal = { bg = mocha.none },
				CmpBorder = { fg = mocha.surface2 },
			}
		end,
	},
}

vim.cmd.colorscheme "catppuccin"
