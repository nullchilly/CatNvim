local present, ts_config = pcall(require, "nvim-treesitter.configs")
if not present then
	return
end

ts_config.setup {
	ignore_install = { "tex", "latex" },
	highlight = {
		enable = true,
		use_languagetree = true,
	},
	matchup = {
		enable = true,
	},
}
