local present, autosave = pcall(require, "indent_blankline")
if not present then
	return
end

require("indent_blankline").setup {
	-- U+2502 may also be a good choice, it will be on the middle of cursor.
	-- U+250A is also a good choice
	char = "▏",
	filetype_exclude = {
		"help",
		"terminal",
		"alpha",
		"packer",
		"lspinfo",
		"TelescopePrompt",
		"TelescopeResults",
	},
	buftype_exclude = { "terminal", "dashboard" },
	show_trailing_blankline_indent = false,
	show_first_indent_level = false,
}
