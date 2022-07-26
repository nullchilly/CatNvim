local present, impatient = pcall(require, "impatient")
if present then
	impatient.enable_profile()
end

require "option"
require "autocmd"
vim.schedule(function()
	require "mapping"
	require "command"
end)

_G.lazy = function(plugin, timer)
	if plugin then
		timer = timer or 0
		vim.defer_fn(function()
			require("packer").loader(plugin)
		end, timer)
	end
end

local fn = vim.fn
local install_path = fn.stdpath "data" .. "/site/pack/packer/opt/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	fn.system { "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path }

	-- install plugins + compile their configs
	vim.cmd.packadd "packer.nvim"
	require "plugin"
	require("packer").sync()
end
