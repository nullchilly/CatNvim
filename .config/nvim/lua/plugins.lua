local present, packer = pcall(require, "packer")

if not present then
	return
end

packer.init {
	auto_clean = true,
	compile_on_sync = true,
	disable_commands = true,
	git = { clone_timeout = 6000 },
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
	use {
		"nvim-lua/plenary.nvim",
		config = function()
			require("base46").load_theme()
		end,
	}
	use {
		"kyazdani42/nvim-web-devicons",
		after = "plenary.nvim",
		config = function()
			require "config.icons"
		end,
	}
	use {
		"feline-nvim/feline.nvim",
		after = "nvim-web-devicons",
		config = function()
			require "config.feline"
		end,
	}
	use {
		"famiu/bufdelete.nvim",
		opt = true,
		setup = function()
			lazy "bufdelete.nvim"
		end,
	}
	use {
		"akinsho/bufferline.nvim",
		requires = "nvim-web-devicons",
		config = function()
			require "config.bufferline"
		end,
	}
	use {
		"lukas-reineke/indent-blankline.nvim",
		opt = true,
		config = function()
			require "config.indent-blankline"
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
	use {
		"rcarriga/nvim-notify",
		opt = true,
		config = function()
			vim.notify = require "notify"
			vim.notify.setup {
				background_colour = "Normal",
				fps = 144,
				icons = {
					DEBUG = "",
					ERROR = "",
					INFO = "",
					TRACE = "✎",
					WARN = "",
				},
				level = "info",
				minimum_width = 50,
				render = "default",
				stages = "fade_in_slide_out",
				timeout = 1000,
			}
		end,
		setup = function()
			lazy "nvim-notify"
		end,
	}
	use {
		"folke/which-key.nvim",
		opt = true,
		config = function()
			require "config.whichkey"
		end,
		setup = function()
			lazy "which-key.nvim"
		end,
	}

	-- git
	use {
		"lewis6991/gitsigns.nvim",
		opt = true,
		config = function()
			require "config.gitsigns"
		end,
		setup = function() lazy "gitsigns.nvim" end,
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
			vim.defer_fn(function()
				vim.cmd "silent! e %"
			end, 0)
		end,
		setup = function()
			lazy "nvim-lspconfig"
		end,
	}
	use {
		"ray-x/lsp_signature.nvim",
		config = function()
			require "config.lsp_signature"
		end,
		after = "nvim-lspconfig",
	}
	use {
		"folke/trouble.nvim",
		requires = "kyazdani42/nvim-web-devicons",
		config = function()
			require("trouble").setup {}
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
	use {
		"zbirenbaum/copilot.lua",
		config = function() require("copilot").setup() end,
		setup = function() lazy("copilot.lua", 100) end
	}
	use {
	   "zbirenbaum/copilot-cmp",
	   after = { "copilot.lua", "nvim-cmp" },
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
	use {
		"Pocco81/AutoSave.nvim",
		opt = true,
		config = function()
			require "config.autosave"
		end,
		setup = function()
			lazy "AutoSave.nvim"
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
		cmd = "Telescope",
		run = "make",
	}
	use {
		"nvim-telescope/telescope.nvim",
		after = {
			"telescope-fzf-native.nvim",
		},
	}
	use {
		"kyazdani42/nvim-tree.lua",
		ft = "alpha",
		cmd = { "NvimTreeToggle", "NvimTreeFocus" },
		config = function()
			require "config.nvimtree"
		end,
	}

	-- Competitive programming
	use {
		"MunifTanjim/nui.nvim",
		cmd = { "CompetiTestRun", "CompetiTestReceive" },
	}
	use {
		"xeluxee/competitest.nvim",
		after = "nui.nvim",
		config = function()
			require "config.competitest"
		end,
	}

	-- misc
	use {
		"lervag/vimtex",
		opt = true,
		config = function()
			require "config.vimtex"
		end,
		setup = function()
			vim.api.nvim_create_autocmd("FileType", {
				pattern = { "tex", "plaintex" },
				callback = function()
					lazy "vimtex"
				end,
			})
		end,
	}
	use {
		"SmiteshP/nvim-gps",
		after = "nvim-treesitter",
		config = function()
			require("nvim-gps").setup()
		end,
	}
	use {
		"goolord/alpha-nvim",
		config = function()
			require "config.alpha"
		end,
	}
	use {
		"andweeb/presence.nvim",
		opt = true,
		config = function()
			require "config.presence"
		end,
		setup = function()
			lazy "presence.nvim"
		end,
	}
end)
