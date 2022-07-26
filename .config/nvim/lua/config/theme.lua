local present, catppuccin = pcall(require, "catppuccin")
if not present then
	return
end

vim.g.catppuccin_flavour = "mocha"

catppuccin.setup {
	color_overrides = {
		mocha = {
			base = "#131313",
		},
	},
	custom_highlights = {
		CmpBorder = { fg = "#3e4145" },
	},
	transprent_background = true,
	term_colors = true,
	compile = {
		enabled = true,
	},
	integrations = {
		nvimtree = {
			enabled = false,
		},
		dap = {
			enabled = true,
			enable_ui = true,
		},
		lightspeed = true,
	},
}

vim.cmd.colorscheme "catppuccin"
