# My lazy neovim config

Heavily based on [nvchad](https://github.com/NvChad/NvChad)

Lazy treesitter because why not?

Tested on AMD R9-5900HX

```
times in msec
 clock   self+sourced   self:  sourced script
 clock   elapsed:              other lines

000.003  000.003: --- NVIM STARTING ---
000.127  000.125: locale set
000.276  000.149: inits 1
000.282  000.006: window checked
001.996  001.714: parsing arguments
002.034  000.038: expanding arguments
002.045  000.012: inits 2
002.294  000.249: init highlight
002.295  000.001: waiting for UI
002.741  000.446: done waiting for UI
002.759  000.018: init screen for UI
002.773  000.013: init default mappings
002.791  000.019: init default autocommands
002.833  000.007  000.007: sourcing /usr/share/nvim/archlinux.vim
002.835  000.031  000.024: sourcing /etc/xdg/nvim/sysinit.vim
006.304  003.458  003.458: sourcing /home/tuna/.config/nvim/init.lua
006.309  000.028: sourcing vimrc file(s)
006.559  000.008  000.008: sourcing /home/tuna/.local/share/nvim/site/pack/packer/start/filetype.nvim/filetype.vim
006.587  000.009  000.009: sourcing /usr/share/nvim/runtime/filetype.vim
006.639  000.020  000.020: sourcing /usr/share/nvim/runtime/ftplugin.vim
006.686  000.015  000.015: sourcing /usr/share/nvim/runtime/indent.vim
006.779  000.041  000.041: sourcing /usr/share/nvim/runtime/syntax/synload.vim
006.825  000.128  000.086: sourcing /usr/share/nvim/runtime/syntax/syntax.vim
007.101  000.008  000.008: sourcing /usr/share/nvim/runtime/plugin/gzip.vim
007.112  000.005  000.005: sourcing /usr/share/nvim/runtime/plugin/health.vim
007.135  000.018  000.018: sourcing /usr/share/nvim/runtime/plugin/man.vim
007.147  000.006  000.006: sourcing /usr/share/nvim/runtime/plugin/matchit.vim
007.227  000.075  000.075: sourcing /usr/share/nvim/runtime/plugin/matchparen.vim
007.243  000.009  000.009: sourcing /usr/share/nvim/runtime/plugin/netrwPlugin.vim
007.314  000.005  000.005: sourcing /home/tuna/.local/share/nvim/rplugin.vim
007.318  000.070  000.065: sourcing /usr/share/nvim/runtime/plugin/rplugin.vim
007.355  000.032  000.032: sourcing /usr/share/nvim/runtime/plugin/shada.vim
007.368  000.006  000.006: sourcing /usr/share/nvim/runtime/plugin/spellfile.vim
007.381  000.007  000.007: sourcing /usr/share/nvim/runtime/plugin/tarPlugin.vim
007.391  000.005  000.005: sourcing /usr/share/nvim/runtime/plugin/tohtml.vim
007.408  000.009  000.009: sourcing /usr/share/nvim/runtime/plugin/tutor.vim
007.422  000.008  000.008: sourcing /usr/share/nvim/runtime/plugin/zipPlugin.vim
007.526  000.780: loading rtp plugins
007.703  000.088  000.088: sourcing /home/tuna/.local/share/nvim/site/pack/packer/start/dashboard-nvim/plugin/dashboard.vim
007.775  000.008  000.008: sourcing /home/tuna/.local/share/nvim/site/pack/packer/start/filetype.nvim/plugin/filetype.vim
007.851  000.018  000.018: sourcing /home/tuna/.local/share/nvim/site/pack/packer/start/nvim-web-devicons/plugin/nvim-web-devicons.vim
007.918  000.017  000.017: sourcing /home/tuna/.local/share/nvim/site/pack/packer/start/plenary.nvim/plugin/plenary.vim
007.996  000.339: loading packages
008.229  000.233: loading after plugins
008.236  000.007: inits 3
008.853  000.617: reading ShaDa
009.350  000.497: opening buffers
009.352  000.002: BufEnter autocommands
009.353  000.001: editing files in windows
011.266  001.913: VimEnter autocommands
011.269  000.002: UIEnter autocommands
011.270  000.001: before starting main loop
012.599  001.329: first screen update
012.601  000.002: --- NVIM STARTED ---
```

