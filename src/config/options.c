#include "../../nvim.h"

int luaopen_config_options() {
  // Nightly
  o("laststatus", i(3));       // Thanks famiu
  o("cmdheight", i(0));        // Thanks shougo
  o("splitkeep", s("screen")); // Thanks luukvbaal

  // Indentline
  o("expandtab", False);
  o("shiftwidth", i(2));
  o("tabstop", i(2));

  // Numbers
  o("number", True);
  o("numberwidth", i(2));
  o("relativenumber", True);

  // Keys
  o("whichwrap", s("<>[]hlb,s"));
  g("mapleader", s(" "));

  // Filetypes
  g("python_recommended_style", i(0));
  g("tex_flavor", s("latex"));

  return 1;
}
