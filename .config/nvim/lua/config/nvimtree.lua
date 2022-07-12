local present, nvimtree = pcall(require, "nvim-tree")
if not present then
	return
end

nvimtree.setup {
	disable_netrw = true,
	hijack_netrw = true,
	ignore_ft_on_setup = { "alpha" },
	open_on_tab = false,
	hijack_cursor = true,
	hijack_unnamed_buffer_when_opening = false,
	update_cwd = true,
	update_focused_file = {
		enable = true,
		update_cwd = false,
	},
	view = {
		width = 25,
	},
	git = {
		enable = false,
		ignore = true,
	},
	actions = {
		open_file = {
			resize_window = true,
		},
	},
	renderer = {
		indent_markers = {
			enable = false,
		},
	},
}
