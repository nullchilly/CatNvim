local M = {}

M.get_colors = function(type)
	-- theme paths
	local theme = vim.g.theme or "radium"

	local present, default_theme = pcall(require, "base46.hl_themes." .. theme)

	if present then
		return default_theme[type]
	else
		error "No such theme"
	end
end

M.merge_tb = function(table1, table2)
	return vim.tbl_deep_extend("force", table1, table2)
end

M.load_theme = function()
	-- clear highlights of bufferline (cuz of dynamic devicons hl group on the buffer)
	local highlights_raw = vim.split(vim.api.nvim_exec("filter BufferLine hi", true), "\n")
	local highlight_groups = {}

	for _, raw_hi in ipairs(highlights_raw) do
		table.insert(highlight_groups, string.match(raw_hi, "BufferLine%a+"))
	end

	for _, highlight in ipairs(highlight_groups) do
		vim.cmd([[hi clear ]] .. highlight)
	end

	-- reload highlights for theme switcher
	require("plenary.reload").reload_module "base46.integrations"
	require("plenary.reload").reload_module "base46.chadlights"

	require "base46.chadlights"
end

M.override_theme = function(default_theme, theme_name)
	return default_theme
end

return M
