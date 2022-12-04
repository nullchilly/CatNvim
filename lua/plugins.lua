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
use "~/code/git/unsafe.nvim" {}
use "nvim-treesitter/playground" {}
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
use "nvim-lualine/lualine.nvim" {
	after = "catppuccin",
	config = function()
		require("lualine").setup {
			options = {
				icons_enabled = true,
				theme = "catppuccin",
				globalstatus = true,
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch", "diff", "diagnostics" },
				lualine_c = { "filename" },
				lualine_x = { "filetype" },
				lualine_y = { "progress" },
				lualine_z = { "location" },
			},
		}
	end,
}
use "akinsho/bufferline.nvim" { config = "config.bufferline", after = "catppuccin" }
use "nvim-treesitter/nvim-treesitter" {
	run = ":TSUpdate",
	config = function()
		require("nvim-treesitter.configs").setup {
			auto_install = true,
			ensure_installed = { "comment" },
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
use "glepnir/lspsaga.nvim" {
	after = "nvim-lspconfig",
	config = function()
		require("lspsaga").init_lsp_saga {
			code_action_lightbulb = {
				enable = true,
				sign = true,
				sign_priority = 20,
				virtual_text = false,
			},
			max_preview_lines = 10,
			finder_action_keys = {
				open = "o",
				vsplit = "s",
				split = "i",
				tabe = "t",
				quit = "q",
				scroll_down = "<C-f>",
				scroll_up = "<C-b>",
			},
			code_action_keys = {
				quit = "q",
				exec = "<CR>",
			},
			custom_kind = require("catppuccin.groups.integrations.lsp_saga").custom_kind(),
			rename_action_quit = "<C-c>",
			symbol_in_winbar = {
				enable = true,
				separator = " > ",
				show_file = true,
			},
			server_filetype_map = {},
		}
	end,
}
use "jose-elias-alvarez/null-ls.nvim" { after = "nvim-lspconfig", config = "config.null-ls" }

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
