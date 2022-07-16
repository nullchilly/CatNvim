local present, bufferline = pcall(require, "bufferline")
if not present then
	return
end

bufferline.setup {
	options = {
		close_command = "bp|sp|bn|bd! %d",
		right_mouse_command = "bp|sp|bn|bd! %d",
		left_mouse_command = "buffer %d",
		offsets = {
			{
				filetype = "NvimTree",
				text = "",
				padding = 1,
			},
		},
		-- custom_filter = function(buf, buf_number)
		-- 	-- print(buf, buf_number)
		-- 	local current_tab = vim.api.nvim_get_current_tabpage()
		-- 	local tab_buffers = vim.fn.tabpagebuflist(current_tab)
		-- 	-- check if the current buffer is being viewed in the current tab
		-- 	return vim.tbl_contains(tab_buffers, buf)
		-- end,
		buffer_close_icon = "",
		modified_icon = "",
		close_icon = "",
		show_close_icon = false,
		left_trunc_marker = "",
		right_trunc_marker = "",
		max_name_length = 14,
		max_prefix_length = 13,
		tab_size = 20,
		show_tab_indicators = true,
		enforce_regular_tabs = false,
		view = "multiwindow",
		show_buffer_close_icons = true,
		separator_style = "thin", -- padded_slant
		always_show_bufferline = true,
		diagnostics = false,
		themable = true,
	},
}
