#include "../../nvim.h"

int luaopen_config_keymaps() {
  // Don't copy when pasting over selection
  map("v", "p", "\"_dP");
  map("v", "P", "\"_dp");

  // bufferline
  for (int i = 1; i <= 9; i++) {
    fmap("n", "<A-%d>", ":%dtabn<CR>", i);
  }

  map("n", "<A-.>", ":BufferLineCycleNext <CR>");
  map("n", "<A-s-.>", ":BufferLineMoveNext <CR>");
  map("n", "<A-,>", ":BufferLineCyclePrev <CR>");
  map("n", "<A-s-,>", ":BufferLineMovePrev <CR>");
  map("n", "<leader>x", ":bp|sp|bn|bd! <CR>");

  // Center cursor
  map("n", "<C-d>", "<C-d>zz");

  // manage windows
  map("n", "<C-h>", "<C-w>h");
  map("n", "<C-j>", "<C-w>j");
  map("n", "<C-k>", "<C-w>k");
  map("n", "<C-l>", "<C-w>l");

  map("n", "<A-h>", "<c-w>5<");
  map("n", "<A-l>", "<C-w>5>");
  map("n", "<A-s-h>", "<c-w>-");
  map("n", "<A-s-l>", "<c-w>+");

  // nvimtree
  map("n", "<C-n>", ":Neotree toggle<CR>");

  // telescope
  map("n", "<leader>fd", ":Telescope find_files <CR>");
  map("n", "<leader>fw", ":Telescope live_grep <CR>");

  return 1;
}
