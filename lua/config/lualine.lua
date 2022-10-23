local present, lualine = pcall(require, "lualine")
if not present then return end

-- Generated from require("lualine.themes.catppuccin")
-- local catppuccin = {
-- 	command = {
-- 		a = { bg = "#FAB387", fg = "#131313", gui = "bold" },
-- 		b = { bg = "#45475A", fg = "#FAB387" },
-- 	},
-- 	inactive = {
-- 		a = { bg = "#181825", fg = "#89B4FA" },
-- 		b = { bg = "#181825", fg = "#45475A", gui = "bold" },
-- 		c = { bg = "#181825", fg = "#6C7086" },
-- 	},
-- 	insert = {
-- 		a = { bg = "#A6E3A1", fg = "#131313", gui = "bold" },
-- 		b = { bg = "#45475A", fg = "#94E2D5" },
-- 	},
-- 	normal = {
-- 		a = { bg = "#B4BEFE", fg = "#181825", gui = "bold" },
-- 		b = { bg = "#45475A", fg = "#B4BEFE" },
-- 		c = { bg = "#181825", fg = "#CDD6F4" },
-- 	},
-- 	replace = {
-- 		a = { bg = "#F38BA8", fg = "#131313", gui = "bold" },
-- 		b = { bg = "#45475A", fg = "#F38BA8" },
-- 	},
-- 	visual = {
-- 		a = { bg = "#CBA6F7", fg = "#131313", gui = "bold" },
-- 		b = { bg = "#45475A", fg = "#CBA6F7" },
-- 	},
-- }

lualine.setup {
	options = {
		icons_enabled = true,
		theme = "catppuccin",
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = {},
		always_divide_middle = true,
		globalstatus = true,
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "branch", "diff", "diagnostics" },
		lualine_c = { "filename" },
		lualine_x = { "filetype" },
		lualine_y = { "progress" },
		lualine_z = { "location" },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = {},
		lualine_x = {},
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	extensions = {},
}
