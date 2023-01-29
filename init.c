#include "nvim.h"

int luaopen_init(lua_State *L) {
  char *lazypath = stdpaths_user_data_subpath("lazy/lazy.nvim");
  if (os_isdir(lazypath) == false) {
    system(concat_str(
      "git "
      "clone "
      "--filter=blob:none "
      "https://github.com/folke/lazy.nvim.git "
      "--branch=stable ",
      lazypath));
  }
  opt("runtimepath", runtimepath_default(false), lazypath);

  require_setup("lazy", R"({
		"spec": [{
				"url": "https://github.com/utilyre/barbecue.nvim.git",
        "dependencies": ["SmiteshP/nvim-navic"],
				"opts": {}
			},
			{
				"url": "https://github.com/nvim-tree/nvim-tree.lua.git",
				"opts": {},
				"cmd": "NvimTreeToggle"
			},
			{
				"url": "https://github.com/catppuccin/nvim.git",
				"name":"catppuccin",
				"opts": {
					"flavour": "mocha",
					"color_overrides": {
						"mocha": {
							"crust": "#000000",
							"mantle": "#000000",
							"base": "#000000"
						}
					}
				}
			},
			{
				"url": "https://github.com/LazyVim/LazyVim.git",
				"import": "lazyvim.plugins"
			},
			{
				"url": "https://github.com/LazyVim/LazyVim.git",
				"opts": { "colorscheme": "catppuccin" }
			}
		],
		"install": {
			"colorscheme":["catppuccin"]
		}
	})");

  return 1;
}
