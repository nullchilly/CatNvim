local map = vim.keymap.set

-- Don't copy when pasting over selection
map("v", "p", '"_dP', { silent = true })
map("v", "P", '"_dp', { silent = true })

-- go to beginning and end
map("i", "<C-b>", "<ESC>^i") -- "論 beginning of line"
map("i", "<C-e>", "<End>") -- "壟 end of line",

-- navigate within insert mode
map("i", "<C-h>", "<Left>") -- "   move left"
map("i", "<C-l>", "<Right>") -- " move right"
map("i", "<C-j>", "<Down>") -- " move down"
map("i", "<C-k>", "<Up>") -- " move up" },

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
map("n", "<leader>bf", "<cmd> BufferLinePick <CR>")

-- close buffer
map("n", "<leader>x", "<cmd> bp|sp|bn|bd! <CR>") --"	close buffer"

-- nvimtree
map("n", "<C-n>", "<cmd> NvimTreeToggle <CR>") -- "	toggle nvimtree",
map("n", "<leader>e", "<cmd> NvimTreeFocus <CR>") -- "	focus nvimtree"

-- telescope
map("n", "<leader>ff", "<cmd> Telescope<CR>") -- "  find files"
map("n", "<leader>fd", "<cmd> Telescope find_files <CR>") -- "  find files"
map("n", "<leader>fa", "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>") --"  find all"
map("n", "<leader>fw", "<cmd> Telescope live_grep <CR>") --"	live grep"
map("n", "<leader>fb", "<cmd> Telescope buffers <CR>") --"  find buffers"
map("n", "<leader>fh", "<cmd> Telescope help_tags <CR>") --"  help page"
map("n", "<leader>fo", "<cmd> Telescope oldfiles <CR>") --"	find oldfiles"
map("n", "<leader>tk", "<cmd> Telescope keymaps <CR>") --"	show keys"

-- git
map("n", "<leader>cm", "<cmd> Telescope git_commits <CR>") --"	git commits"
map("n", "<leader>gt", "<cmd> Telescope git_status <CR>") --"  git status"

map("n", "<leader>pt", "<cmd> Telescope terms <CR>") --"	pick hidden term"

-- toggleterm
map("t", "<A-i>", "<C-\\><C-n>:ToggleTerm direction=float<CR>") --"	toggle floating term"
map("t", "<C-\\>", "<C-\\><C-n>:ToggleTerm direction=horizontal<CR>") --"	new horizontal term"
map("t", "<A-v>", "<C-\\><C-n>:ToggleTerm direction=vertical<CR>") --"	new vertical term"
map("n", "<A-i>", ":ToggleTerm direction=float<CR>") --"	toggle floating term"

-- new
map("n", "<C-\\>", ":ToggleTerm direction=horizontal<CR>") --"	new horizontal term"
map("n", "<A-v>", ":ToggleTerm direction=vertical<CR>") --"	new vertical term"
