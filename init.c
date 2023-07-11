#include "nvim.h"

int luaopen_init(lua_State *L) {
  char *lazypath = concat_str(get_xdg_home(1), "lazy/lazy.nvim/");
  if (os_isdir(lazypath) == false) {
    system(concat_str("git clone --filter=blob:none "
                      "https://github.com/folke/lazy.nvim.git --branch=stable ",
                      lazypath));
  }
  opt("runtimepath", runtimepath_default(false), lazypath);
#ifndef __clang__
  require_setup("lazy", R"(
    {
      spec = {
        {
          'catppuccin/nvim',
          name = 'catppuccin',
          opts = {
            color_overrides = {
              mocha = {
                base = '#000000',
                mantle = '#000000',
                crust = '#000000',
              },
            },
          }
        },
        {
          'LazyVim/LazyVim',
          import = 'lazyvim.plugins',
          opts = { colorscheme = 'catppuccin' }
        }
      },
      install = {
        colorscheme = { 'catppuccin' }
      }
    })");
  // clang-format off
#else // clang doesn't support multiline raw string
  require_setup("lazy", "{ spec = { { 'catppuccin/nvim', name = 'catppuccin', opts = { color_overrides = { mocha = { base = '#000000', mantle = '#000000', crust = '#000000', }, }, } }, { 'LazyVim/LazyVim', import = 'lazyvim.plugins', opts = { colorscheme = 'catppuccin' } } }, install = { colorscheme = { 'catppuccin' } } }");
#endif

  return 1;
}
