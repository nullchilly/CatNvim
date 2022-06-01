local colors = require("base46").get_colors "base_30"

return {

	Feline = {
		fg = colors.grey_fg2,
		bg = colors.statusline_bg,
	},

	FelineIcon = {
		fg = colors.statusline_bg,
		bg = colors.nord_blue,
	},

	FelineIconSeparator = {
		fg = colors.nord_blue,
		bg = colors.lightbg,
	},

	FelineFileName = {
		fg = colors.white,
		bg = colors.lightbg,
	},

	FelineFileName_Separator = {
		fg = colors.lightbg,
		bg = colors.lightbg2,
	},

	FelineDirName = {
		fg = colors.light_grey,
		bg = colors.lightbg2,
	},

	FelineDirName_Separator = {
		fg = colors.lightbg2,
		bg = colors.statusline_bg,
	},

	Feline_diffIcons = {
		fg = colors.light_grey,
		bg = colors.statusline_bg,
	},

	-- LSP

	Feline_lspError = {
		fg = colors.red,
		bg = colors.statusline_bg,
	},

	Feline_lspWarning = {
		fg = colors.yellow,
		bg = colors.statusline_bg,
	},

	Feline_LspHints = {
		fg = colors.purple,
		bg = colors.statusline_bg,
	},

	Feline_LspInfo = {
		fg = colors.green,
		bg = colors.statusline_bg,
	},

	Feline_LspIcon = {
		fg = colors.nord_blue,
		bg = colors.statusline_bg,
	},

	Feline_LspProgress = {
		fg = colors.green,
		bg = colors.statusline_bg,
	},

	-- MODES

	Feline_NormalMode = {
		fg = colors.red,
		bg = colors.one_bg,
	},

	Feline_InsertMode = {
		fg = colors.dark_purple,
		bg = colors.one_bg,
	},

	Feline_TerminalMode = {
		fg = colors.green,
		bg = colors.one_bg,
	},

	Feline_VisualMode = {
		fg = colors.cyan,
		bg = colors.one_bg,
	},

	Feline_ReplaceMode = {
		fg = colors.orange,
		bg = colors.one_bg,
	},

	Feline_ConfirmMode = {
		fg = colors.teal,
		bg = colors.one_bg,
	},

	Feline_CommandMode = {
		fg = colors.pink,
		bg = colors.one_bg,
	},

	Feline_SelectMode = {
		fg = colors.nord_blue,
		bg = colors.one_bg,
	},

	Feline_EmptySpace = {
		fg = colors.one_bg2,
		bg = colors.one_bg,
	},

	Feline_EmptySpace_git = {
		fg = colors.one_bg,
		bg = colors.statusline_bg,
	},

	Feline_CurrentLine = {
		fg = colors.green,
		bg = colors.one_bg,
	},

	Feline_PositionIcon = {
		fg = colors.black,
		bg = colors.green,
	},

	Feline_PositionSeparator = {
		fg = colors.green,
		bg = colors.one_bg2,
	},
}
