vim.o.expandtab = true
vim.o.shiftwidth = 2
vim.o.tabstop = 2
vim.o.numberwidth = 2
vim.o.cmdheight = 0
vim.o.scrolloff = 0

vim.o.whichwrap = "<>[]hlb,s"
vim.g.mapleader = " "

vim.g.python_recommended_style = 0
vim.g.tex_flavor = "latex"

if vim.fn.has("wsl") == 1 then
	vim.g.clipboard = {
		name = "psyank-wsl",
		copy = {
			["+"] = "/mnt/c/Windows/System32/clip.exe",
			["*"] = "/mnt/c/Windows/System32/clip.exe",
		},
		paste = {
			["+"] = [[/mnt/c/Windows/System32/WindowsPowerShell/v1.0/powershell.exe -NoProfile -NoLogo -NonInteractive -Command [console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))]],
			["*"] = [[/mnt/c/Windows/System32/WindowsPowerShell/v1.0/powershell.exe -NoProfile -NoLogo -NonInteractive -Command [console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))]],
		},
		cache_enabled = 0,
	}
end
