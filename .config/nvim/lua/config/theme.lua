local present, catppuccin = pcall(require, "catppuccin")
if not present then return end

vim.g.catppuccin_flavour = "mocha"

catppuccin.setup {
	color_overrides = {
		mocha = {
			base = "#131313",
		},
	},
	custom_highlights = {
		VertSplit = { fg = "#313244" },
		CmpBorder = { fg = "#3e4145" },
	},
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
		lsp_saga = true,
		leap = true,
		neogit = true,
	},
}

vim.api.nvim_command "colorscheme catppuccin"
