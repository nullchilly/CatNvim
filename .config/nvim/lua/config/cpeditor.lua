local present, cp = pcall(require, "cpeditor")
if not present then
	return
end

if vim.fn.argv(0) ~= "cp" then
	return
end

cp.setup {
	integration = {
		bufferline = true,
	},
}

require("bufferline").setup {
	options = {
		mode = "tabs",
		close_command = "tabclose",
		right_mouse_command = "tabclose",
		left_mouse_command = "tabnew %d",
		offsets = {
			{
				filetype = "NvimTree",
				text = "",
				padding = 1,
			},
		},
		name_formatter = function(tab) -- tab contains a "name", "path" and "tabnr"
			local problem = require("cpeditor.problems").list[tab.tabnr]
			if problem == nil then
				return tab.name
			end
			return problem.name
		end,
		custom_areas = {
			right = function()
				local result = {}
				table.insert(result, { text = require("cpeditor.layout").tabline() })
				return result
			end,
		},
		buffer_close_icon = "",
		modified_icon = "",
		close_icon = "",
		show_close_icon = false,
		left_trunc_marker = "",
		right_trunc_marker = "",
		max_name_length = 100,
		max_prefix_length = 13,
		tab_size = 20,
		show_tab_indicators = true,
		enforce_regular_tabs = false,
		view = "multiwindow",
		show_buffer_close_icons = true,
		separator_style = "thin",
		always_show_bufferline = true,
		diagnostics = false,
		themable = true,
	},
}

vim.keymap.set("n", "<leader>x", "<cmd> tabclose <CR>") --"	close buffer"
vim.keymap.set("n", "t", function()
	vim.cmd("Cpeditor test " .. vim.v.count)
end)

vim.keymap.set("n", "<A-c>", function()
	vim.cmd "Cpeditor compile_run"
end)

vim.cmd [[Cpeditor receive forever]]
