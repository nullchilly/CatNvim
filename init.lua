local present, _ = pcall(require, "impatient")
require "option"
require "mapping"

local install_path = vim.fn.stdpath "data" .. "/site/pack/packer/opt/packer.nvim"
if not present or vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	vim.fn.system { "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path }
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#131313" })
	vim.api.nvim_command "packadd packer.nvim"
	require "plugins"
	require("packer").sync()
end
