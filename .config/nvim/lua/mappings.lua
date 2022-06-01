-- n, v, i are mode names

local function termcodes(str)
	return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local M = {}

M.general = {

	i = {

		-- go to beginning and end
		["<C-b>"] = { "<ESC>^i", "論 beginning of line" },
		["<C-e>"] = { "<End>", "壟 end of line" },

		-- navigate within insert mode
		["<C-h>"] = { "<Left>", "  move left" },
		["<C-l>"] = { "<Right>", " move right" },
		["<C-j>"] = { "<Down>", " move down" },
		["<C-k>"] = { "<Up>", " move up" },
	},

	n = {

		["<esc>"] = { "<cmd> noh <CR>", "  no highlight" },

		-- manage windows
		["<A-h>"] = { "<c-w>5<", " decrease width" },
		["<A-l>"] = { "<C-w>5>", " increase width" },
		["<A-s-h>"] = { "<c-w>-", " decrease height" },
		["<A-s-l>"] = { "<c-w>+", " increase height" },
		["<C-h>"] = { "<C-w>h", " window down" },
		["<C-j>"] = { "<C-w>j", " window up" },
		["<C-k>"] = { "<C-w>k", " window down" },
		["<C-l>"] = { "<C-w>l", " window up" },

		-- save
		["<C-s>"] = { "<cmd> w <CR>", "﬚  save file" },

		-- line numbers
		["<leader>n"] = { "<cmd> set nu! <CR>", "	toggle line number" },
		["<leader>rn"] = { "<cmd> set rnu! <CR>", "	toggle relative number" },

		-- Will add autocmd
		-- map('n', '<F8>', ':TermExec cmd="runhaskell %"<CR>')
		-- map('n', '<F9>', ':w | TermExec cmd=":l %"<CR>')
		["<A-c>"] = { ":VimtexCompile<CR>", "run code" },
	},

	v = {
		["<C-c>"] = { '"+y', "  copy selected text" },
		["<"] = { "<gv", "move chunk without reset" },
		[">"] = { ">gv", "move chunk without reset" },
	},

	t = {
		["<esc>"] = { termcodes "<C-\\><C-N>", "	escape terminal mode" },
		["<C-j>"] = { termcodes "<C-\\><C-n><C-w>w", " window down" },
		["<C-k>"] = { termcodes "<C-\\><C-n><C-w>W", " window up" },
	},
}

M.bufferline = {

	n = {
		-- new buffer
		["<S-b>"] = { "<cmd> enew <CR>", "烙 new buffer" },

		-- cycle through buffers
		["<TAB>"] = { "<cmd> BufferLineCycleNext <CR>", "  cycle next buffer" },
		["<S-Tab>"] = { "<cmd> BufferLineCyclePrev <CR>", "  cycle prev buffer" },

		-- close buffer + hide terminal buffer
		["<C-x>"] = { "<cmd> Bdelete <CR>", "	close buffer" },
	},
}

M.comment = {

	-- toggle comment in both modes
	n = {
		["<leader>/"] = {
			function()
				require("Comment.api").toggle_current_linewise()
			end,

			"蘒  toggle comment",
		},
	},

	v = {
		["<leader>/"] = {
			"<ESC><cmd>lua require('Comment.api').toggle_linewise_op(vim.fn.visualmode())<CR>",
			"蘒  toggle comment",
		},
	},
}

M.lspconfig = {
	-- See `<cmd> :help vim.lsp.*` for documentation on any of the below functions

	n = {
		["gD"] = {
			function()
				vim.lsp.buf.declaration()
			end,
			"	lsp declaration",
		},

		["gd"] = {
			function()
				vim.lsp.buf.definition()
			end,
			"	lsp definition",
		},

		["K"] = {
			function()
				vim.lsp.buf.hover()
			end,
			"	lsp hover",
		},

		["gi"] = {
			function()
				vim.lsp.buf.implementation()
			end,
			"	lsp implementation",
		},

		["<leader>ls"] = {
			function()
				vim.lsp.buf.signature_help()
			end,
			"	lsp signature_help",
		},

		["<leader>D"] = {
			function()
				vim.lsp.buf.type_definition()
			end,
			"	lsp definition type",
		},

		["<leader>ra"] = {
			function()
				vim.lsp.buf.rename()
			end,
			"	lsp rename",
		},

		["<leader>ca"] = {
			function()
				vim.lsp.buf.code_action()
			end,
			"	lsp code_action",
		},

		["gr"] = {
			function()
				vim.lsp.buf.references()
			end,
			"	lsp references",
		},

		["<leader>f"] = {
			function()
				vim.diagnostic.open_float()
			end,
			"	floating diagnostic",
		},

		["[d"] = {
			function()
				vim.diagnostic.goto_prev()
			end,
			"	goto prev",
		},

		["d]"] = {
			function()
				vim.diagnostic.goto_next()
			end,
			"	goto_next",
		},

		["<leader>q"] = {
			function()
				vim.diagnostic.setloclist()
			end,
			"	diagnostic setloclist",
		},

		["<leader>fm"] = {
			function()
				vim.lsp.buf.formatting()
			end,
			"	lsp formatting",
		},

		["<leader>wa"] = {
			function()
				vim.lsp.buf.add_workspace_folder()
			end,
			"	add workspace folder",
		},

		["<leader>wr"] = {
			function()
				vim.lsp.buf.remove_workspace_folder()
			end,
			"	remove workspace folder",
		},

		["<leader>wl"] = {
			function()
				print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
			end,
			"	list workspace folders",
		},
	},
}

M.trouble = {
	n = {
		["<leader>tl"] = { ":TroubleToggle<CR>", "Toggle trouble list" },
	},
}

M.dap = {
	n = {
		["<leader>dd"] = {
			function()
				require("dapui").toggle()
			end,
			"toggle dapui",
		},
		["<leader>db"] = {
			function()
				require("dap").toggle_breakpoint()
			end,
			"toggle breakpoint",
		},
		["<leader>dH"] = { ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>", "" },
		["<leader>do"] = {
			function()
				require("dap").step_out()
			end,
			"step out",
		},
		["<leader>di"] = {
			function()
				require("dap").step_into()
			end,
			"step into",
		},
		["<leader>ds"] = {
			function()
				require("dap").step_over()
			end,
			"step over",
		},
		["<leader>dc"] = {
			function()
				require("dap").continue()
			end,
			"continue",
		},
		["<leader>dn"] = {
			function()
				require("dap").run_to_cursor()
			end,
			"run to cursor",
		},
		["<leader>dt"] = {
			function()
				require("dap").terminate()
			end,
			"terminal",
		},
		["<leader>dR"] = {
			function()
				require("dap").clear_breakpoints()
			end,
			"clear breakpoints",
		},
		["<leader>de"] = {
			function()
				require("dap").set_exception_breakpoints { "all" }
			end,
			"set exception breakpoints",
		},
		-- ['<leader>da'] = {function() require"debugHelper".attach() end, ""},
		-- ['<leader>dA'] = {function() require"debugHelper".attachToRemote() end, ""},
		["<leader>dh"] = {
			function()
				require("dap.ui.widgets").hover()
			end,
			"hover dapui widgets",
		},
		["<leader>d?"] = {
			function()
				local widgets = require "dap.ui.widgets"
				widgets.centered_float(widgets.scopes)
			end,
			"",
		},
		["<leader>dk"] = { ':lua require"dap".up()<CR>zz', "" },
		["<leader>dj"] = { ':lua require"dap".down()<CR>zz', "" },
		["<leader>dr"] = { ':lua require"dap".repl.toggle({}, "vsplit")<CR><C-w>l', "" },
	},
}

M.nvimtree = {

	n = {
		-- toggle
		["<C-n>"] = { "<cmd> NvimTreeToggle <CR>", "	toggle nvimtree" },

		-- focus
		["<leader>e"] = { "<cmd> NvimTreeFocus <CR>", "	focus nvimtree" },
	},
}

M.telescope = {
	n = {
		-- find
		["<leader>ff"] = { "<cmd> Telescope find_files <CR>", "  find files" },
		["<leader>fa"] = { "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>", "  find all" },
		["<leader>fw"] = { "<cmd> Telescope live_grep <CR>", "	live grep" },
		["<leader>fb"] = { "<cmd> Telescope buffers <CR>", "  find buffers" },
		["<leader>fh"] = { "<cmd> Telescope help_tags <CR>", "  help page" },
		["<leader>fo"] = { "<cmd> Telescope oldfiles <CR>", "	find oldfiles" },
		["<leader>tk"] = { "<cmd> Telescope keymaps <CR>", "	show keys" },

		-- git
		["<leader>cm"] = { "<cmd> Telescope git_commits <CR>", "	git commits" },
		["<leader>gt"] = { "<cmd> Telescope git_status <CR>", "  git status" },

		-- pick a hidden term
		["<leader>pt"] = { "<cmd> Telescope terms <CR>", "	pick hidden term" },

		-- theme switcher
		["<leader>th"] = { "<cmd> Telescope themes <CR>", "	nvchad themes" },
	},
}

M.toggleterm = {
	t = {
		["<A-i>"] = { termcodes "<C-\\><C-n>:ToggleTerm direction=float<CR>", "	toggle floating term" },

		-- new
		["<C-\\>"] = { termcodes "<C-\\><C-n>:ToggleTerm direction=horizontal<CR>", "	new horizontal term" },
		["<A-v>"] = { termcodes "<C-\\><C-n>:ToggleTerm direction=vertical<CR>", "	new vertical term" },
	},

	n = {
		-- toggle in normal mode
		["<A-i>"] = { ":ToggleTerm direction=float<CR>", "	toggle floating term" },

		-- new
		["<C-\\>"] = { ":ToggleTerm direction=horizontal<CR>", "	new horizontal term" },
		["<A-v>"] = { ":ToggleTerm direction=vertical<CR>", "	new vertical term" },
	},
}

M.whichkey = {
	n = {
		["<leader>wK"] = {
			function()
				vim.cmd "WhichKey"
			end,
			"	which-key all keymaps",
		},
		["<leader>wk"] = {
			function()
				local input = vim.fn.input "WhichKey: "
				vim.cmd("WhichKey " .. input)
			end,
			"	which-key query lookup",
		},
	},
}

return M
