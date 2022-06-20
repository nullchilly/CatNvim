local function cmd(lhs, fun, opt)
	vim.api.nvim_create_user_command(lhs, fun, opt or {})
end

cmd("W", [[execute 'silent! write !sudo tee % >/dev/null' <bar> edit!]])

cmd("Messages", [[execute "tabnew <bar> pu=execute('messages') <bar> setl nomodified"]])

cmd("P", function(info)
	vim.cmd("lua print(" .. info.args .. ")")
end, { nargs = "+" })

cmd("PP", function(info)
	vim.cmd("lua vim.pretty_print(" .. info.args .. ")")
end, { nargs = "+" })

cmd("Theme", function(info)
	vim.g.theme = info.args
	require("base46").load_theme()
end, { nargs = "+" })

local packer_cmd = function(callback)
	return function()
		vim.cmd "silent! luafile %"
		require "plugin"
		require("packer")[callback]()
	end
end

cmd("PackerClean", packer_cmd "clean")
cmd("PackerCompile", packer_cmd "compile")
cmd("PackerInstall", packer_cmd "install")
cmd("PackerStatus", packer_cmd "status")
cmd("PackerSync", packer_cmd "sync")
cmd("PackerUpdate", packer_cmd "update")

cmd("PackerSnapshot", function(info)
	require("packer").snapshot(info.args)
end, { nargs = "+" })

cmd("PackerSnapshotDelete", function(info)
	require("packer.snapshot").delete(info.args)
end, { nargs = "+" })

cmd("PackerSnapshotRollback", function(info)
	require("packer").rollback(info.args)
end, { nargs = "+" })
