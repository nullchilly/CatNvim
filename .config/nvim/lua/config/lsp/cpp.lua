require "lspconfig".ccls.setup {
	init_options = {
		clang = {
			extraArgs = { "-std=c++20", "-Wall", "-O2" },
		}
	}
}
