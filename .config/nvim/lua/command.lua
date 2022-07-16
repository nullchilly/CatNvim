local function cmd(lhs, fun, opt)
	vim.api.nvim_create_user_command(lhs, fun, opt or {})
end

-- too lazy to port to lua
cmd("W", [[execute 'silent! write !sudo tee % >/dev/null' <bar> edit!]])
cmd("Messages", [[execute "tabnew <bar> pu=execute('messages') <bar> setl nomodified"]])

local packer_cmd = function(callback)
	return function()
		vim.cmd "silent! luafile %"
		require "plugin"
		require("packer")[callback]()
	end
end

cmd("PackerClean", packer_cmd "clean")
cmd("PackerCompile", packer_cmd "compile")
cmd("PackerProfile", packer_cmd "profile_output")
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
