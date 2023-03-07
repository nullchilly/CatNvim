return {
{
	"nvim-neotest/neotest",
	config = true,
	keys = {
		{ "<leader>Tt", function() require("neotest").run.run() end },
		{ "<leader>Tm", function() require("neotest").summary.marked() end },
		{ "<leader>Ts", function() require("neotest").summary.toggle() end },
	},
},
	{ "lambdalisue/suda.vim", cmd = { "SudaRead", "SudaWrite" } },
}
