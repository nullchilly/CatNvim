vim.o.expandtab = true

vim.keymap.set("n", "<A-c>", ':w | TermExec go_back=0 cmd=":l %"<CR>')
vim.keymap.set("n", "<A-r>", ':TermExec go_back=0 cmd="runhaskell %"<CR>')
