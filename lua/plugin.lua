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
		if type(opts.setup) == "string" then opts.setup = "lazy'" .. opts.setup .. "'" end
		if opts.setup then opts.opt = true end
		packer.use(opts)
	end
end

use "gpanders/editorconfig.nvim" {}
use "nvim-lua/plenary.nvim" { module = "plenary" }
use "kyazdani42/nvim-web-devicons" { module = "nvim-web-devicons" }
use "catppuccin/nvim" {
	"~/code/git/catppuccin",
	as = "catppuccin",
	config = "config.catppuccin",
}
use "feline-nvim/feline.nvim" {
	after = "catppuccin",
	config = function()
		local ctp_feline = require "catppuccin.groups.integrations.feline"

		require("feline").setup {
			components = ctp_feline.get(),
		}

		vim.api.nvim_create_autocmd("ColorScheme", {
			pattern = "*",
			callback = function()
				package.loaded["feline"] = nil
				package.loaded["catppuccin.groups.integrations.feline"] = nil
				require("feline").setup {
					components = require("catppuccin.groups.integrations.feline").get(),
				}
			end,
		})
	end,
}
use "akinsho/bufferline.nvim" { config = "config.bufferline", after = "catppuccin" }
use "nvim-treesitter/nvim-treesitter" {
	after = "catppuccin",
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
	setup = "nvim-treesitter",
}
use "lervag/vimtex" {
	config = function()
		vim.g.vimtex_view_method = "zathura"
		vim.g.vimtex_quickfix_mode = 0
		vim.o.conceallevel = 2
		vim.g.tex_conceal = "abdmg"
	end,
	setup = function() lazyft("tex", "vimtex") end,
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
use "NvChad/nvim-colorizer.lua" {
	config = function()
		require("colorizer").setup {}
		require("colorizer").attach_to_buffer(0)
	end,
	setup = "nvim-colorizer.lua",
}

-- git
use "tpope/vim-fugitive" { cmd = { "G", "Git" } }
use "lewis6991/gitsigns.nvim" {
	config = function() require "config.gitsigns" end,
	setup = function()
		if vim.fn.isdirectory ".git" ~= 0 then lazy "gitsigns.nvim" end
	end,
}

-- lsp
use "neovim/nvim-lspconfig" { config = "config.lsp", setup = "nvim-lspconfig" }
use "glepnir/lspsaga.nvim" { after = "nvim-lspconfig", config = "config.lsp.saga" }
use "jose-elias-alvarez/null-ls.nvim" { after = "nvim-lspconfig", config = "config.lsp.null-ls" }

-- Debugger
use "mfussenegger/nvim-dap" { module = "dap", config = "config.dap" }
use "rcarriga/nvim-dap-ui" { module = "dapui", config = "config.dap.ui" }

-- Auto complete
use "hrsh7th/nvim-cmp" {
	event = "InsertEnter",
	requires = {
		{ "hrsh7th/cmp-nvim-lsp", after = "nvim-cmp" },
		{ "hrsh7th/cmp-buffer", after = "nvim-cmp" },
		{ "hrsh7th/cmp-path", after = "nvim-cmp" },
		{ "saadparwaiz1/cmp_luasnip", after = "LuaSnip" },
	},
	config = "config.cmp",
}
use "L3MON4D3/LuaSnip" { after = "nvim-cmp", config = "config.luasnip" }
use "windwp/nvim-autopairs" {
	after = "nvim-cmp",
	config = function()
		require("nvim-autopairs").setup()
		require("cmp").event:on("confirm_done", require("nvim-autopairs.completion.cmp").on_confirm_done())
	end,
}
use "kylechui/nvim-surround" {
	config = function() require("nvim-surround").setup {} end,
	setup = "nvim-surround",
}
use "numToStr/Comment.nvim" {
	module = "Comment",
	keys = { "gc", "gb" },
	config = function() require("Comment").setup {} end,
}

-- Terminal
use "akinsho/toggleterm.nvim" { cmd = { "ToggleTerm", "TermExec" }, config = "config.toggleterm" }

-- File manager
use "nvim-telescope/telescope.nvim" {
	module = "telescope",
	cmd = "Telescope",
	config = function() require("telescope").setup {} end,
}
use "nvim-telescope/telescope-fzf-native.nvim" {
	after = "telescope.nvim",
	run = "make",
	config = function() require("telescope").load_extension "fzf" end,
}
use "kyazdani42/nvim-tree.lua" { cmd = { "NvimTreeToggle", "NvimTreeFocus" }, config = "config.nvimtree" }

-- Misc
use "lewis6991/impatient.nvim" {}
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
	config = "plugin",
}
