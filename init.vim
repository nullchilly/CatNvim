lua << EOF
  if not vim.loop.fs_stat(vim.fn.stdpath("config") .. "/init.so") then
    vim.cmd.make()
  end
  require "init"
EOF
