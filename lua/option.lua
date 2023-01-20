local o = vim.opt
local g = vim.g
o.wrap = false

o.guicursor:append { "i-c-ci:ver25", "o-v-ve:hor20", "cr-sm-n-r:block" }
o.laststatus = 3 -- global statusline
o.title = true
o.cul = true -- cursor line
o.showmode = false
o.cmdheight = 0 -- Thanks shougo
if vim.version().minor >= 9 then
	o.splitkeep = "screen" -- Thanks luukvbaal
end

-- Indentline
o.expandtab = false
o.shiftwidth = 2
o.smartindent = true

-- disable tilde on end of buffer: https://github.com/neovim/neovim/pull/8546#issuecomment-643643758
o.fillchars = { eob = " " }

o.ignorecase = true
o.smartcase = true
o.mouse = "a"

-- Numbers
o.number = true
o.numberwidth = 2
o.relativenumber = true
o.ruler = false

-- disable nvim intro
o.shortmess:append "sI"

o.signcolumn = "yes"
o.splitbelow = true
o.splitright = true
o.tabstop = 2
o.termguicolors = true
o.timeoutlen = 400
o.undofile = true

-- interval for writing swap file to disk, also used by gitsigns
o.updatetime = 250

-- go to previous/next line with h,l,left arrow and right arrow
-- when cursor reaches end/beginning of line
o.whichwrap:append "<>[]hl"
g.mapleader = " "

g.python_recommended_style = 0
g.tex_flavor = "latex"
o.pumheight = 15
o.linebreak = true

local default_providers = {
	"node",
	"perl",
	"python3",
	"ruby",
}

for _, provider in ipairs(default_providers) do
	vim.g["loaded_" .. provider .. "_provider"] = 0
end
