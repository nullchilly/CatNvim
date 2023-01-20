return {
	"nvim-lua/plenary.nvim",
	"nvim-tree/nvim-web-devicons",
	{ "nullchilly/fsread.nvim", cmd = { "FSRead", "FSClear", "FSToggle" } },
	{ "lambdalisue/suda.vim", cmd = { "SudaRead", "SudaWrite" } },
	"p00f/nvim-ts-rainbow",
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter.configs").setup {
				auto_install = true,
				ensure_installed = { "comment" },
				ignore_install = { "tex", "latex" },
				highlight = {
					enable = true,
					use_languagetree = true,
				},
				rainbow = {
					enable = true,
					extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
					max_file_lines = nil, -- Do not enable for files with more than n lines, int
				},
			}
		end,
	},
	{
		"m-demare/hlargs.nvim",
		ft = "python",
	},

	-- Misc
	{ "NvChad/nvim-colorizer.lua", config = function() require("colorizer").setup {} end },
	{
		"vim-airline/vim-airline",
		lazy = true,
		dependencies = "vim-airline/vim-airline-themes",
		config = function() vim.g.airline_theme = "catppuccin" end,
	},
}
