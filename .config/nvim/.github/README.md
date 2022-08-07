# My lazy neovim config

Tested on AMD R9-5900HX

```
times in msec
 clock   self+sourced   self:  sourced script
 clock   elapsed:              other lines

000.011  000.011: --- NVIM STARTING ---
000.075  000.064: event init
000.125  000.050: early init
000.154  000.029: locale set
000.173  000.019: init first window
000.340  000.167: inits 1
000.346  000.006: window checked
000.348  000.001: parsing arguments
000.592  000.036  000.036: require('vim.shared')
000.666  000.033  000.033: require('vim._meta')
000.667  000.073  000.040: require('vim._editor')
000.668  000.128  000.018: require('vim._init_packages')
000.669  000.194: init lua interpreter
000.688  000.020: expanding arguments
000.720  000.031: inits 2
000.865  000.146: init highlight
000.866  000.001: waiting for UI
001.517  000.651: done waiting for UI
001.525  000.009: init screen for UI
001.544  000.019: init default mappings
001.556  000.012: init default autocommands
001.974  000.070  000.070: sourcing /usr/local/share/nvim/runtime/ftplugin.vim
002.026  000.019  000.019: sourcing /usr/local/share/nvim/runtime/indent.vim
002.058  000.008  000.008: sourcing /usr/share/nvim/archlinux.vim
002.060  000.020  000.011: sourcing /etc/xdg/nvim/sysinit.vim
003.546  001.421  001.421: require('option')
003.618  001.544  000.123: sourcing /home/nullchilly/.config/nvim/init.lua
003.624  000.415: sourcing vimrc file(s)
003.791  000.015  000.015: sourcing /usr/share/vim/vimfiles/ftdetect/lf.vim
003.863  000.200  000.185: sourcing /usr/local/share/nvim/runtime/filetype.lua
003.885  000.010  000.010: sourcing /usr/local/share/nvim/runtime/filetype.vim
003.993  000.049  000.049: sourcing /usr/local/share/nvim/runtime/syntax/synload.vim
004.078  000.168  000.119: sourcing /usr/local/share/nvim/runtime/syntax/syntax.vim
004.429  000.010  000.010: sourcing /usr/local/share/nvim/runtime/plugin/gzip.vim
004.444  000.006  000.006: sourcing /usr/local/share/nvim/runtime/plugin/health.vim
004.473  000.023  000.023: sourcing /usr/local/share/nvim/runtime/plugin/man.vim
004.487  000.006  000.006: sourcing /usr/local/share/nvim/runtime/plugin/matchit.vim
004.580  000.087  000.087: sourcing /usr/local/share/nvim/runtime/plugin/matchparen.vim
004.606  000.017  000.017: sourcing /usr/local/share/nvim/runtime/plugin/netrwPlugin.vim
004.696  000.005  000.005: sourcing /home/nullchilly/.local/share/nvim/rplugin.vim
004.700  000.085  000.080: sourcing /usr/local/share/nvim/runtime/plugin/rplugin.vim
004.745  000.038  000.038: sourcing /usr/local/share/nvim/runtime/plugin/shada.vim
004.760  000.006  000.006: sourcing /usr/local/share/nvim/runtime/plugin/spellfile.vim
004.776  000.009  000.009: sourcing /usr/local/share/nvim/runtime/plugin/tarPlugin.vim
004.789  000.006  000.006: sourcing /usr/local/share/nvim/runtime/plugin/tohtml.vim
004.806  000.010  000.010: sourcing /usr/local/share/nvim/runtime/plugin/tutor.vim
004.832  000.019  000.019: sourcing /usr/local/share/nvim/runtime/plugin/zipPlugin.vim
004.899  000.010  000.010: sourcing /usr/share/vim/vimfiles/plugin/fzf.vim
005.548  000.006  000.006: require('vim.F')
005.742  000.086  000.086: require('catppuccin')
005.811  000.066  000.066: require('catppuccin.config')
006.955  000.854  000.854: sourcing /home/nullchilly/.local/share/nvim/site/pack/packer/start/theme/colors/catppuccin.lua
006.960  001.602  000.590: require('config.theme')
007.396  000.068  000.068: require('lualine_require')
007.593  000.581  000.513: require('lualine')
010.049  000.039  000.039: require('lualine.utils.mode')
010.116  003.154  002.534: require('config.lualine')
010.525  000.145  000.145: require('indent_blankline/utils')
010.528  000.407  000.262: require('indent_blankline')
010.692  000.114  000.114: require('packer.load')
010.911  005.971  000.694: sourcing /home/nullchilly/.config/nvim/plugin/packer_compiled.lua
011.057  000.752: loading rtp plugins
011.258  000.048  000.048: require('indent_blankline.commands')
011.302  000.168  000.120: sourcing /home/nullchilly/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim/plugin/indent_blankline.vim
011.401  000.008  000.008: sourcing /home/nullchilly/.local/share/nvim/site/pack/packer/start/theme/plugin/catppuccin.vim
011.498  000.266: loading packages
011.511  000.013: loading after plugins
011.519  000.008: inits 3
013.148  001.629: reading ShaDa
013.299  000.044  000.044: require('vim.inspect')
013.419  000.228: opening buffers
013.458  000.039: BufEnter autocommands
013.460  000.002: editing files in windows
013.622  000.162: VimEnter autocommands
013.624  000.002: UIEnter autocommands
013.625  000.001: before starting main loop
013.888  000.263: first screen update
013.890  000.001: --- NVIM STARTED ---
```
