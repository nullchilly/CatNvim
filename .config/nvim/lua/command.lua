local function cmd(lhs, fun, opt)
	vim.api.nvim_create_user_command(lhs, fun, opt or {})
end

-- too lazy to port to lua
cmd("W", [[execute 'silent! write !sudo tee % >/dev/null' <bar> edit!]])
cmd("Messages", [[execute "tabnew <bar> pu=execute('messages') <bar> setl nomodified"]])

vim.api.nvim_create_user_command("ListFilesFromBranch", function(opts)
	require("fzf-lua").fzf_exec("git ls-tree -r " .. opts.args .. " --name-only", {
		prompt = opts.args .. "> ",
		actions = {
			["ctrl-v"] = function(selected)
				-- run Gvsplit with args?
				vim.cmd("Gvsplit " .. opts.args .. ":" .. selected)
			end,
		},
		fn_transform = function(x)
			return require("fzf-lua").make_entry.file(x, { file_icons = true, color_icons = true })
		end,
	})
end, {
	nargs = 1,
	complete = function()
		function os.capture(command, raw)
			local f = assert(io.popen(command, 'r'))
			local s = assert(f:read('*a'))
			f:close()
			if raw then return s end
			s = string.gsub(s, '^%s+', '')
			s = string.gsub(s, '%s+$', '')
			s = string.gsub(s, '[\n\r]+', ' ')
			return s
		end
		local branches = os.capture [[git branch --sort=-committerdate --format='%(refname:short)' | grep -v '\->' | sed "s,\x1B\[[0-9;]*[a-zA-Z],,g"]]
		return vim.split(branches, " ")
	end,
})

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
