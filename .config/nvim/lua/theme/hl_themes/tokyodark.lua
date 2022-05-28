local M = {}

M.base_30 = {
	white = "#abb2bf",
	darker_black = "#0e0f1a",
	black = "#11121D", --  nvim bg
	black2 = "#171823",
	one_bg = "#191a25",
	one_bg2 = "#21222d",
	one_bg3 = "#2c2d38",
	grey = "#383944",
	grey_fg = "#3e3f4a",
	grey_fg2 = "#454651",
	light_grey = "#4b4c57",
	red = "#ee6d85",
	baby_pink = "#fd7c94",
	pink = "#fe6D85",
	line = "#191a25",
	green = "#98c379",
	vibrant_green = "#95c561",
	nord_blue = "#648ce1",
	blue = "#7199ee",
	yellow = "#d7a65f",
	sun = "#dfae67",
	purple = "#a485dd",
	dark_purple = "#9071c9",
	teal = "#519aba",
	orange = "#f6955b",
	cyan = "#38a89d",
	statusline_bg = "#151621",
	lightbg = "#262732",
	lightbg2 = "#1c1d28",
	pmenu_bg = "#98C379",
	folder_bg = "#8094B4",
}

M.base_16 = {
	base00 = "#11121d",
	base01 = "#1b1c27",
	base02 = "#21222d",
	base03 = "#282934",
	base04 = "#30313c",
	base05 = "#abb2bf",
	base06 = "#b2b9c6",
	base07 = "#b9c0cd",
	base08 = "#ee6d85",
	base09 = "#7199ee",
	base0A = "#7199ee",
	base0B = "#dfae67",
	base0C = "#a485dd",
	base0D = "#95c561",
	base0E = "#a485dd",
	base0F = "#f3627a",
}

M = require("base46").override_theme(M, "tokyodark")

return M
