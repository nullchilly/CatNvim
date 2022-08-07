local function cmd(lhs, fun, opt) vim.api.nvim_create_user_command(lhs, fun, opt or {}) end

-- too lazy to port to lua
cmd("W", [[execute 'silent! write !sudo tee % >/dev/null' <bar> edit!]])
cmd("Messages", [[execute "tabnew <bar> pu=execute('messages') <bar> setl nomodified"]])
