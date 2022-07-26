local wezterm = require("wezterm")
local catppuccin = wezterm.get_builtin_color_schemes()["Catppuccin Mocha"]
catppuccin.background = "#131313"

return {
	hide_tab_bar_if_only_one_tab = true,
	-- front_end = "OpenGL",
	font = wezterm.font("JetBrains Mono"),
	color_schemes = {
		["Catppuccin Mocha"] = catppuccin,
	},
	color_scheme = "Catppuccin Mocha",
}
