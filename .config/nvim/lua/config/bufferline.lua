local present, bufferline = pcall(require, 'bufferline')
if not present then
	return
end

bufferline.setup {
	options = {
		close_command = 'bp|sp|bn|bd! %d',
		right_mouse_command = 'bp|sp|bn|bd! %d',
		left_mouse_command = 'buffer %d',
		offsets = {
			{
				filetype = 'NvimTree',
				text = '',
				padding = 1,
			},
		},
		buffer_close_icon = '',
		modified_icon = '',
		close_icon = '',
		show_close_icon = false,
		left_trunc_marker = '',
		right_trunc_marker = '',
		max_name_length = 14,
		max_prefix_length = 13,
		tab_size = 20,
		show_tab_indicators = true,
		enforce_regular_tabs = false,
		view = 'multiwindow',
		show_buffer_close_icons = true,
		separator_style = 'thin',
		always_show_bufferline = true,
		diagnostics = false,
		themable = true,
	},
}
