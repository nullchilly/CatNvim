local present, alpha = pcall(require, "alpha")
if not present then
	return
end

local function button(sc, txt, keybind)
	local sc_ = sc:gsub("%s", ""):gsub("SPC", "<leader>")

	local opts = {
		position = "center",
		text = txt,
		shortcut = sc,
		cursor = 5,
		width = 36,
		align_shortcut = "right",
		hl = "AlphaButtons",
	}

	if keybind then
		opts.keymap = { "n", sc_, keybind, { noremap = true, silent = true } }
	end

	return {
		type = "button",
		val = txt,
		on_press = function()
			local key = vim.api.nvim_replace_termcodes(sc_, true, false, true)
			vim.api.nvim_feedkeys(key, "normal", false)
		end,
		opts = opts,
	}
end

local default = {}

default.ascii = {
	"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⣠⢤⡤⠤⠄⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
	"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⣴⣶⣿⣿⣷⣾⣿⣾⣿⣷⣶⣦⣄⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
	"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣴⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣤⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
	"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣤⠄⡀⠀⠀⠀⠀⠀⠀",
	"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣰⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⡀⠀⠀⠀⠀⠀⠀",
	"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢢⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡀⢀⠀⠀⠀⠀",
	"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⢠⣿⣿⣿⣿⣿⡿⢯⣿⣿⣿⡿⣹⣿⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⠀⡀⠀⠀⠀",
	"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣿⣿⣿⣿⣿⣿⠁⢱⣿⣿⢿⠁⢻⣿⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡀⠀⠀⠀⠀",
	"⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣿⣿⣿⣿⣿⣿⣿⡶⣾⡁⠀⠈⠀⠸⠃⠸⢿⣿⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀⠀⠀⠀",
	"⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⣟⣸⠟⣱⡤⢠⠀⠀⠀⠀⠀⠀⠀⠀⠙⡶⣾⣿⣿⢣⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⡆⠀⠀⠀",
	"⠀⠀⠀⠀⠀⠀⠀⠀⣸⣿⣿⣿⣿⠋⠀⠀⠿⠠⠆⠀⠀⠀⠀⠀⠀⠀⠀⡤⠄⣠⠙⣯⢘⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⠃⠀⠀⠀",
	"⠀⠀⠀⠀⠀⠀⠀⢠⣿⣿⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠐⠁⠆⡿⠀⢸⠎⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀",
	"⠀⠀⠀⠀⠀⠀⠀⣾⣿⣿⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠀⠐⠁⠀⠘⢂⣿⣿⣿⣿⣿⣿⢿⣿⣿⣿⣿⣿⡇⠀⠀⠀",
	"⠀⠀⠀⠀⠀⠀⢸⣿⣿⣿⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠀⠀⠀⠀⣸⣿⣿⣿⣿⣿⣷⣸⣿⣿⣿⣿⣿⡇⠀⠀⠀",
	"⠀⠀⠀⠀⠀⠀⢸⣿⣿⣿⣿⣿⣇⠀⠀⠀⠀⠀⠀⢀⢀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢰⣿⣿⣿⣿⣿⡿⣱⣿⣿⣿⣿⣿⣿⣷⠀⠀⠀",
	"⠀⠀⠀⠀⠀⠀⢸⣿⣿⣿⣿⣿⣿⣄⠀⠀⠀⠀⠀⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⣿⡆⠀⠀",
	"⠀⠀⠀⠀⠀⠀⢸⣿⣿⣿⣿⣿⣿⣿⣦⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠁⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠃⢸⣧⠀⠀",
	"⠀⠀⠀⠀⠀⠀⠘⣿⣿⣿⣿⣿⣿⣿⣿⣿⣦⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⠴⠒⣹⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣏⣾⡟⠀⠸⣿⠀⠀",
	"⠀⠀⠀⠀⠀⠀⠀⠸⢿⣿⡟⣿⣿⣿⣿⣿⣿⣿⣶⣤⣀⣠⠤⠔⠂⠈⠁⠀⠀⢠⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀⠀⣿⡆⠀",
	"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠻⣷⣽⣿⣿⣿⣿⣿⣿⣿⣿⣿⠣⠀⠀⠀⠀⠀⠀⠀⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⡀⠀⣿⠃⠀",
	"⠀⠀⠀⠀⠀⠀⠀⠀⠄⠀⠹⣿⢿⣿⣿⣿⣽⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⢠⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣤⠏⠀⠀",
}

default.header = {
	type = "text",
	val = default.ascii,
	opts = {
		position = "center",
		hl = "AlphaHeader",
	},
}

default.buttons = {
	type = "group",
	val = {
		button("SPC f f", "  Find File  ", ":Telescope find_files<CR>"),
		button("SPC f o", "  Recent File  ", ":Telescope oldfiles<CR>"),
		button("SPC f w", "  Find Word  ", ":Telescope live_grep<CR>"),
		button("SPC f n", "洛 New File  ", ":Alpha<CR>"),
		button("SPC b m", "  Bookmarks  ", ":Telescope marks<CR>"),
	},
	opts = {
		spacing = 1,
	},
}

alpha.setup {
	layout = {
		{ type = "padding", val = 9 },
		default.header,
		{ type = "padding", val = 2 },
		default.buttons,
	},
	opts = {},
}
