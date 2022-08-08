require "option"

vim.schedule(function()
	require "autocmd"
	require "mapping"
	require "command"
end)

_G.lazy = function(plugin, timer)
	vim.defer_fn(function()
		pcall(require, "impatient")
		require("packer").loader(plugin)
		if plugin == "nvim-lspconfig" then vim.cmd "silent! do FileType" end
	end, timer or 0)
end

_G.lazyft = function(filetype, plugin, timer)
	vim.api.nvim_create_autocmd("FileType", {
		pattern = filetype,
		callback = function()
			vim.defer_fn(function() require("packer").loader(plugin) end, timer or 0)
		end,
	})
end

_G.dev = function(a, b)
	if vim.fn.isdirectory(vim.fn.expand(a)) == 1 then return a end
	return b
end

local install_path = vim.fn.stdpath "data" .. "/site/pack/packer/opt/packer.nvim"
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	vim.fn.system { "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path }
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#131313" })
	vim.api.nvim_command "packadd packer.nvim"
	require "plugin"
	require("packer").sync()
end
