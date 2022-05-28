local present, wk = pcall(require, "which-key")
if not present then
	return
end

local options = {
	mode_opts = {
		n = {
			mode = "n",
		},

		v = {
			mode = "v",
		},

		i = {
			mode = "i",
		},

		t = {
			mode = "t",
		},
	},

	icons = {
		breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
		separator = "  ", -- symbol used between a key and it's label
		group = "+", -- symbol prepended to a group
	},

	popup_mappings = {
		scroll_down = "<c-d>", -- binding to scroll down inside the popup
		scroll_up = "<c-u>", -- binding to scroll up inside the popup
	},

	window = {
		border = "none", -- none/single/double/shadow
	},

	layout = {
		spacing = 6, -- spacing between columns
	},

	hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " },

	triggers_blacklist = {
		-- list of mode / prefixes that should never be hooked by WhichKey
		i = { "j", "k" },
		v = { "j", "k" },
	},
}

local mappings = require "mappings"
local mapping_groups = { groups = vim.deepcopy(mappings.groups) }

mappings.disabled = nil
mappings.groups = nil

-- register mappings
local function register_mappings(maps, opts)
	for mode, opt in pairs(opts.mode_opts) do
		for _, value in pairs(maps) do
			if value[mode] then
				local mode_opts = value["mode_opts"] and vim.tbl_deep_extend("force", opt, value["mode_opts"]) or opt
				wk.register(value[mode], mode_opts)
			end
		end
	end
end

register_mappings(mappings, options)
register_mappings(mapping_groups, options)

wk.setup(options)
