return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		-- lazy = true,
		config = function()
			require("catppuccin").setup {
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
					mocha = {
						base = "#000000",
						mantle = "#000000",
						crust = "#000000",
					},
				},
				highlight_overrides = {
					mocha = function(C)
						return {
							TabLineSel = { bg = C.pink },
							CmpBorder = { fg = C.surface2 },
							Pmenu = { bg = C.none },
							TelescopeBorder = { link = "FloatBorder" },
						}
					end,
				},
			}

			vim.cmd.colorscheme "catppuccin"
		end,
	},
	{
		"EdenEast/nightfox.nvim",
		lazy = true,
		config = function()
			require("nightfox").setup {}
			vim.cmd.colorscheme "nightfox"
		end,
	},
	{
		"folke/tokyonight.nvim",
		lazy = true,
		config = function()
			require("tokyonight").setup {}
			vim.cmd.colorscheme "tokyonight"
		end,
	},
	{
		"olimorris/onedarkpro.nvim",
		lazy = true,
		config = function()
			require("onedarkpro").setup {}
			vim.cmd.colorscheme "onedark"
		end,
	},
}
