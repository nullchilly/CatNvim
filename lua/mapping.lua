local map = vim.keymap.set

-- Don't copy when pasting over selection
map("v", "p", '"_dP')
map("v", "P", '"_dp')

-- go to beginning and end
map("i", "<C-b>", "<ESC>^i") -- "論 beginning of line"
map("i", "<C-e>", "<End>") -- "壟 end of line",

-- navigate within insert mode
map("i", "<C-h>", "<Left>") -- "   move left"
map("i", "<C-l>", "<Right>") -- " move right"
map("i", "<C-j>", "<Down>") -- " move down"
map("i", "<C-k>", "<Up>") -- " move up" },
map("n", "<C-d>", "<C-d>zz")

map("n", "<esc>", "<cmd> noh <CR>") -- "  no highlight")

-- manage windows
map("n", "<A-h>", "<c-w>5<") --" decrease width"
map("n", "<A-l>", "<C-w>5>") --" increase width"
map("n", "<A-s-h>", "<c-w>-") --" decrease height"
map("n", "<A-s-l>", "<c-w>+") --" increase height"
map("n", "<C-j>", "<C-w>w") --" window up"
map("n", "<C-k>", "<C-w>W") --" window down"

-- save
map("n", "<C-s>", "<cmd> w <CR>") --"﬚  save file"

map("v", "<C-c>", '"+y') --"  copy selected text"
map("v", "<", "<gv") --"move chunk without reset"
map("v", ">", ">gv") --"move chunk without reset"

map("t", "<esc>", "<C-\\><C-N>") --"	escape terminal mode"
map("t", "<C-j>", "<C-\\><C-n><C-w>w") --" window down"
map("t", "<C-k>", "<C-\\><C-n><C-w>W") --" window up"

-- bufferline
map("n", "<S-b>", "<cmd> enew <CR>") --"烙 new buffer"
map("n", "<A-.>", "<cmd> BufferLineCycleNext <CR>") --"  cycle next buffer"
map("n", "<A-,>", "<cmd> BufferLineCyclePrev <CR>") --"  cycle prev buffer"
map("n", "<A-s-.>", "<cmd> BufferLineMoveNext <CR>") --"  cycle next buffer"
map("n", "<A-s-,>", "<cmd> BufferLineMovePrev <CR>") --"  cycle prev buffer"
map("n", "<A-f>", "<cmd> BufferLinePick <CR>")
map("n", "<leader>x", "<cmd> bp|sp|bn|bd! <CR>") --"	close buffer"
for i = 1, 9 do
	-- map("n", "<A-" .. i .. ">", function() require("bufferline").go_to_buffer(i) end)
	map("n", "<A-" .. i .. ">", "<cmd>" .. i .. "tabn<CR>")
end

-- nvimtree
map("n", "<C-n>", "<cmd> NvimTreeToggle <CR>") -- "	toggle nvimtree",
map("n", "<leader>e", "<cmd> NvimTreeFocus <CR>") -- "	focus nvimtree"

-- telescope
map("n", "<leader>ff", "<cmd> Telescope<CR>") -- "  find files"
map("n", "<leader>fd", "<cmd> Telescope find_files <CR>") -- "  find files"
map("n", "<leader>fa", "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>") --"  find all"
map("n", "<leader>fw", "<cmd> Telescope live_grep <CR>") --"	live grep"
map("n", "<leader>fp", "<cmd> Telescope pickers <CR>") --"	pickers"
map("n", "<leader>fr", "<cmd> Telescope registers <CR>") --"	pickers"
map("n", "<leader>fb", "<cmd> Telescope buffers <CR>") --"  find buffers"
map("n", "<leader>fh", "<cmd> Telescope help_tags <CR>") --"  help page"
map("n", "<leader>fo", "<cmd> Telescope oldfiles <CR>") --"	find oldfiles"

-- git
map("n", "<leader>cm", "<cmd> Telescope git_commits <CR>") --"	git commits"
map("n", "<leader>gt", "<cmd> Telescope git_status <CR>") --"  git status"

map("n", "<leader>pt", "<cmd> Telescope terms <CR>") --"	pick hidden term"

-- toggleterm
map("t", "<A-i>", "<C-\\><C-n>:ToggleTerm direction=float<CR>") --"	toggle floating term"
map("t", "<C-\\>", "<C-\\><C-n>:ToggleTerm direction=horizontal<CR>") --"	new horizontal term"
map("t", "<A-v>", "<C-\\><C-n>:ToggleTerm direction=vertical<CR>") --"	new vertical term"
map("n", "<A-i>", "<cmd> ToggleTerm direction=float<CR>") --"	toggle floating term"

-- new
map("n", "<C-\\>", "<cmd> ToggleTerm direction=horizontal<CR>") --"	new horizontal term"
map("n", "<A-v>", "<cmd> ToggleTerm direction=vertical<CR>") --"	new vertical term"

-- lspsaga
map("n", "gh", "<cmd>Lspsaga lsp_finder<CR>")
map("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>")
map("v", "<leader>ca", "<cmd><C-U>Lspsaga range_code_action<CR>")
map("n", "K", "<cmd>Lspsaga hover_doc<CR>")
map("n", "<C-f>", function() require("lspsaga.action").smart_scroll_with_saga(1) end)
map("n", "<C-b>", function() require("lspsaga.action").smart_scroll_with_saga(-1) end)
-- map("n", "gs", "<Cmd>Lspsaga signature_help<CR>")
map("n", "gr", "<cmd>Lspsaga rename<CR>")
map("n", "gd", "<cmd>Lspsaga preview_definition<CR>")
map("n", "<leader>cd", "<cmd>Lspsaga show_line_diagnostics<CR>")
map("n", "<leader>cd", "<cmd>Lspsaga show_cursor_diagnostics<CR>")
map("n", "[e", "<cmd>Lspsaga diagnostic_jump_next<CR>")
map("n", "]e", "<cmd>Lspsaga diagnostic_jump_prev<CR>")
