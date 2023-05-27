return {
	{
		"rcarriga/nvim-notify",
		enabled = false,
	},
	{
		"stevearc/dressing.nvim",
		enabled = false,
	},
	{
		"folke/noice.nvim",
		enabled = false,
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		opts = {
			char = "▏",
		},
	},
	{
		"echasnovski/mini.indentscope",
		opts = { symbol = "▏" },
	},
	{
		"NvChad/nvim-colorizer.lua",
		event = "BufRead",
		config = true,
	},
	{
		"akinsho/bufferline.nvim",
		opts = {
			options = {
				indicator = {
					style = "underline",
				},
			},
		},
	},
	{
		"utilyre/barbecue.nvim",
		event = "VeryLazy",
		name = "barbecue",
		opts = {},
	},
	{
		"nvim-lualine/lualine.nvim",
		opts = {
			theme = "catppuccin",
			options = {
				component_separators = " ",
				section_separators = { left = "", right = "" },
			},
			extensions = { "quickfix" },
		},
	},
}
