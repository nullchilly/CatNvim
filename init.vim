lua << EOF
  local config_path = vim.fn.stdpath("config")
  if not vim.loop.fs_stat(config_path .. "/lua/init.so") then
    vim.cmd.cd(config_path)
    vim.cmd.make() -- compile C sources
  end
  require "init"
EOF
