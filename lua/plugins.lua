local present, packer = pcall(require, "packer")
if not present then return end

packer.init {
	auto_reload_compiled = true,
	compile_on_sync = true,
	git = { clone_timeout = 6000 },
	display = {
		open_fn = function() return require("packer.util").float { border = "single" } end,
	},
}

local use = function(plugin)
	return function(opts)
		opts = opts or {}
		if not opts[1] or vim.fn.isdirectory(vim.fn.expand(opts[1])) == 0 then opts[1] = plugin end
		if type(opts.config) == "string" then opts.config = "require'" .. opts.config .. "'" end
		if opts.setup then opts.opt = true end
		packer.use(opts)
	end
end

use "nvim-treesitter/playground" {}
use "kkharji/sqlite.lua" {}
use "karb94/neoscroll.nvim" {
	config = function() require("neoscroll").setup() end,
}
use "nullchilly/fsread.nvim" {
	"~/code/git/fsread.nvim",
}
use "catppuccin/nvim" {
	"~/code/git/catppuccin",
	as = "catppuccin",
	config = "config.catppuccin",
}

use "nvim-lua/plenary.nvim" { module = "plenary" }
use "kyazdani42/nvim-web-devicons" { module = "nvim-web-devicons" }
use "nvim-lualine/lualine.nvim" { after = "catppuccin", config = "config.lualine" }
use "akinsho/bufferline.nvim" { config = "config.bufferline", after = "catppuccin" }
use "nvim-treesitter/nvim-treesitter" {
	run = ":TSUpdate",
	config = function()
		require("nvim-treesitter.configs").setup {
			auto_install = true,
			ignore_install = { "tex", "latex" },
			highlight = {
				enable = true,
				use_languagetree = true,
			},
		}
	end,
}
use "lukas-reineke/indent-blankline.nvim" {
	config = function()
		require("indent_blankline").setup {
			char = "▏",
			char_blankline = " ",
			filetype_exclude = { "help", "terminal", "packer", "lspinfo", "TelescopePrompt", "TelescopeResults" },
			buftype_exclude = { "terminal" },
			show_first_indent_level = false,
		}
	end,
}

-- git
use "lewis6991/gitsigns.nvim" {
	config = function() require "config.gitsigns" end,
	setup = function()
		if vim.fn.isdirectory ".git" ~= 0 then require("packer").loader "gitsigns.nvim" end
	end,
}

-- lsp
use "neovim/nvim-lspconfig" { config = "config.lsp" }
use "glepnir/lspsaga.nvim" { after = "nvim-lspconfig", config = "config.lsp.saga" }
use "jose-elias-alvarez/null-ls.nvim" { after = "nvim-lspconfig", config = "config.lsp.null-ls" }

-- Auto complete
use "hrsh7th/nvim-cmp" {
	event = "InsertEnter",
	requires = {
		{ "hrsh7th/cmp-nvim-lsp", after = "nvim-cmp" },
		{ "hrsh7th/cmp-buffer", after = "nvim-cmp" },
		{ "hrsh7th/cmp-path", after = "nvim-cmp" },
	},
	config = "config.cmp",
}
use "windwp/nvim-autopairs" {
	after = "nvim-cmp",
	config = function()
		require("nvim-autopairs").setup()
		require("cmp").event:on("confirm_done", require("nvim-autopairs.completion.cmp").on_confirm_done())
	end,
}
use "numToStr/Comment.nvim" {
	module = "Comment",
	keys = { "gc", "gb" },
	config = function() require("Comment").setup {} end,
}

-- File manager
use "nvim-telescope/telescope.nvim" {
	module = "telescope",
	cmd = "Telescope",
	config = function() require("telescope").setup {} end,
}
use "kyazdani42/nvim-tree.lua" { cmd = { "NvimTreeToggle", "NvimTreeFocus" }, config = "config.nvimtree" }

-- Misc
use "lewis6991/impatient.nvim" {}
use "gpanders/editorconfig.nvim" {}
use "luukvbaal/stabilize.nvim" { config = function() require("stabilize").setup() end }
use "NvChad/nvim-colorizer.lua" { config = function() require("colorizer").setup {} end }
use "kylechui/nvim-surround" { config = function() require("nvim-surround").setup {} end }
use "akinsho/toggleterm.nvim" { cmd = { "ToggleTerm", "TermExec" }, config = "config.toggleterm" }
use "dstein64/vim-startuptime" { cmd = "StartupTime" }
use "wbthomason/packer.nvim" {
	cmd = {
		"PackerSnapshot",
		"PackerSnapshotRollback",
		"PackerSnapshotDelete",
		"PackerInstall",
		"PackerUpdate",
		"PackerSync",
		"PackerClean",
		"PackerCompile",
		"PackerStatus",
		"PackerProfile",
		"PackerLoad",
	},
	config = "plugins",
}
