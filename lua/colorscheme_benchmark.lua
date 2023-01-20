vim.o.eventignore = "ColorScheme"
local themes = { "nightfox", { "onedarkpro", "onedark" }, "catppuccin", "tokyonight" }
for _, theme in ipairs(themes) do
	local mod = theme
	if type(mod) == "table" then
		mod = theme[1]
		theme = theme[2]
	end
	local now = vim.loop.hrtime
	local sums = 0
	local sumh = 0
	local inter = 1000

	for _ = 1, inter do
		for name, _ in pairs(package.loaded) do
			if name:match("^" .. theme) then package.loaded[name] = nil end
		end

		local start = now()
		require(mod).setup {}
		sums = sums + (now() - start)
	end

	local cnt = 0
	local hl = vim.api.nvim_set_hl
	vim.api.nvim_set_hl = function() cnt = cnt + 1 end
	vim.cmd.colorscheme(theme)
	vim.api.nvim_set_hl = hl

	for _ = 1, inter do
		local start = now()
		vim.cmd.colorscheme(theme)
		sumh = sumh + (now() - start)
	end

	print(
		string.format(
			"%s: %.2fms startuptime; %.2fms to setup, %.2fus per 1 highlight (average of %s highlights)",
			mod,
			(sums + sumh) / inter / 1000000,
			sums / inter / 1000000,
			sumh / inter / 1000 / cnt,
			cnt
		)
	)
end
