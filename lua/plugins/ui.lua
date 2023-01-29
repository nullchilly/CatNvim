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
			indent = {
				char = "▏",
			},
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
	"Bekaboo/dropbar.nvim",
	{
		"nvim-lualine/lualine.nvim",
		opts = {
			theme = "catppuccin",
			options = {
				component_separators = " ",
				section_separators = { left = "", right = "" },
			},
		},
	},
}
