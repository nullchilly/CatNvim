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
	"Bekaboo/dropbar.nvim",
	{ "SmiteshP/nvim-navic", enabled = false },
	{
		"nvim-lualine/lualine.nvim",
		optional = false,
		enabled = false,
		opts = {
			theme = "catppuccin",
			options = {
				component_separators = " ",
				section_separators = { left = "", right = "" },
			},
		},
	},
	{
		"famiu/feline.nvim",
		config = function()
			require("feline").setup({
				components = require("catppuccin.groups.integrations.feline").get(),
			})
		end,
	},
}
