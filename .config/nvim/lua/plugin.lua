local present, packer = pcall(require, "packer")

if not present then
	return
end

packer.init {
	auto_clean = true,
	auto_reload_compiled = true,
	compile_on_sync = true,
	disable_commands = true,
	git = { clone_timeout = 6000 },
	profile = {
		enable = true,
		threshold = 0,
	},
	display = {
		working_sym = "ﲊ",
		error_sym = "✗",
		done_sym = "﫟",
		removed_sym = "",
		moved_sym = "",
		open_fn = function()
			return require("packer.util").float { border = "rounded" }
		end,
	},
}

packer.startup(function(use)
	-- core
	use "lewis6991/impatient.nvim"
	use "wbthomason/packer.nvim"
	use "nvim-lua/plenary.nvim"
	use {
		"sgoudham/nvim",
		as = "theme",
		run = "CatppuccinCompile",
		branch = "dev",
		config = function()
			vim.g.catppuccin_flavour = "mocha"
			require("catppuccin").setup {
				transparent_background = true,
				term_colors = true,
				compile = {
					enabled = true,
					path = vim.fn.stdpath "cache" .. "/catppuccin",
					suffix = "_compiled",
				},
				integrations = {
					nvimtree = {
						enabled = false,
					},
				},
			}
			vim.cmd "colorscheme catppuccin"
		end,
	}
	use {
		"kyazdani42/nvim-web-devicons",
		after = "theme",
	}
	use {
		"nvim-lualine/lualine.nvim",
		after = "nvim-web-devicons",
		config = function()
			require "config.lualine"
		end,
	}
	use {
		"akinsho/bufferline.nvim",
		after = "nvim-web-devicons",
		config = function()
			require "config.bufferline"
		end,
	}
	use {
		"lukas-reineke/indent-blankline.nvim",
		opt = true,
		config = function()
			require("indent_blankline").setup {
				char = "▏",
				filetype_exclude = {
					"help",
					"terminal",
					"packer",
					"lspinfo",
					"TelescopePrompt",
					"TelescopeResults",
				},
				buftype_exclude = { "terminal" },
				show_trailing_blankline_indent = false,
				show_first_indent_level = false,
			}
		end,
		setup = function()
			lazy "indent-blankline.nvim"
		end,
	}
	use {
		"norcalli/nvim-colorizer.lua",
		opt = true,
		config = function()
			require("colorizer").setup()
		end,
		setup = function()
			lazy "nvim-colorizer.lua"
		end,
	}

	-- git
	use {
		"lewis6991/gitsigns.nvim",
		opt = true,
		config = function()
			require "config.gitsigns"
		end,
		setup = function()
			lazy "gitsigns.nvim"
		end,
	}

	use {
		"andymass/vim-matchup",
		opt = true,
		config = function()
			vim.g.matchup_matchparen_offscreen = {}
		end,
		setup = function()
			lazy "vim-matchup"
		end,
	}
	use {
		"nvim-treesitter/nvim-treesitter",
		after = "vim-matchup",
		run = ":TSUpdate",
		config = function()
			require "config.treesitter"
		end,
	}

	-- lsp
	use {
		"neovim/nvim-lspconfig",
		opt = true,
		config = function()
			require "config.lsp"
		end,
		setup = function()
			lazy "nvim-lspconfig"
		end,
	}
	use {
		"glepnir/lspsaga.nvim",
		after = "nvim-lspconfig",
		config = function()
			require "config.lsp.saga"
		end,
	}
	use {
		"jose-elias-alvarez/null-ls.nvim",
		after = "nvim-lspconfig",
		config = function()
			require "config.lsp.null-ls"
		end,
	}

	-- Debugger
	use {
		"mfussenegger/nvim-dap",
		module = "dap",
		config = function()
			require "config.dap"
		end,
	}
	use {
		"rcarriga/nvim-dap-ui",
		module = "dapui",
		config = function()
			require "config.dap.ui"
		end,
	}

	-- Movement
	use {
		"xiyaowong/accelerated-jk.nvim",
		event = "CursorHold",
		config = function()
			require("accelerated-jk").setup()
		end,
	}
	use {
		"ggandor/lightspeed.nvim",
		opt = true,
		setup = function()
			lazy "lightspeed.nvim"
		end,
	}

	-- Auto complete
	use {
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		config = function()
			require "config.cmp"
		end,
	}
	use {
		"L3MON4D3/LuaSnip",
		after = "nvim-cmp",
		config = function()
			require "config.luasnip"
		end,
	}
	use { "saadparwaiz1/cmp_luasnip", after = "LuaSnip" }
	use { "hrsh7th/cmp-nvim-lua", after = "cmp_luasnip" }
	use { "hrsh7th/cmp-nvim-lsp", after = "cmp-nvim-lua" }
	use { "hrsh7th/cmp-buffer", after = "cmp-nvim-lsp" }
	use { "hrsh7th/cmp-path", after = "cmp-buffer" }
	use {
		"windwp/nvim-autopairs",
		after = "nvim-cmp",
		config = function()
			require "config.autopairs"
		end,
	}

	-- IDE layer
	use {
		"numToStr/Comment.nvim",
		module = "Comment",
		keys = { "gc", "gb" },
		config = function()
			require("Comment").setup {}
		end,
	}

	-- terminal
	use {
		"akinsho/toggleterm.nvim",
		cmd = "ToggleTerm",
		config = function()
			require "config.toggleterm"
		end,
	}
	use {
		"luukvbaal/stabilize.nvim",
		opt = true,
		config = function()
			require("stabilize").setup()
		end,
		setup = function()
			lazy "stabilize.nvim"
		end,
	}

	-- File manager
	use {
		"nvim-telescope/telescope-fzf-native.nvim",
		after = "telescope.nvim",
		run = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
		config = function()
			require("telescope").load_extension "fzf"
		end,
	}
	use {
		"nvim-telescope/telescope.nvim",
		opt = true,
		config = function()
			require("telescope").setup {
				extensions = {},
			}
		end,
		setup = function()
			lazy "telescope.nvim"
		end,
	}
	use {
		"kyazdani42/nvim-tree.lua",
		cmd = { "NvimTreeToggle", "NvimTreeFocus" },
		config = function()
			require "config.nvimtree"
		end,
	}

	-- Competitive programming
	use {
		"~/.local/git/cpeditor.nvim",
		opt = true,
		config = function()
			require "config.cpeditor"
		end,
		setup = function()
			lazy "cpeditor.nvim"
		end,
	}

	-- misc
	use {
		"lervag/vimtex",
		opt = true,
		config = function()
			vim.g.vimtex_view_method = "zathura"
			vim.g.vimtex_quickfix_mode = 0
			vim.o.conceallevel = 2
			vim.g.tex_conceal = "abdmg"
		end,
		setup = function()
			vim.api.nvim_create_autocmd("FileType", {
				pattern = "tex",
				callback = function()
					lazy "vimtex"
				end,
			})
		end,
	}
end)
