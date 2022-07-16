# My lazy neovim config

Keep it fast (Under 20ms) while not losing sanity (lualine instead of feline) and (bufferline instead of tabby)

Tested on AMD R9-5900HX

```
times in msec
 clock   self+sourced   self:  sourced script
 clock   elapsed:              other lines

000.004  000.004: --- NVIM STARTING ---
000.059  000.054: event init
000.119  000.061: early init
000.145  000.026: locale set
000.170  000.025: init first window
000.369  000.199: inits 1
000.376  000.007: window checked
000.378  000.002: parsing arguments
000.627  000.034  000.034: require('vim.shared')
000.720  000.047  000.047: require('vim._meta')
000.721  000.092  000.045: require('vim._editor')
000.722  000.146  000.020: require('vim._init_packages')
000.723  000.199: init lua interpreter
000.743  000.019: expanding arguments
000.769  000.027: inits 2
000.911  000.142: init highlight
000.912  000.001: waiting for UI
001.388  000.476: done waiting for UI
001.394  000.007: init screen for UI
001.410  000.015: init default mappings
001.422  000.013: init default autocommands
001.832  000.050  000.050: sourcing /usr/share/nvim/runtime/ftplugin.vim
001.885  000.019  000.019: sourcing /usr/share/nvim/runtime/indent.vim
001.919  000.007  000.007: sourcing /usr/share/nvim/archlinux.vim
001.921  000.021  000.014: sourcing /etc/xdg/nvim/sysinit.vim
003.234  001.255  001.255: require('option')
003.385  000.149  000.149: require('autocmd')
003.399  001.463  000.060: sourcing /home/nullchilly/.config/nvim/init.lua
003.404  000.429: sourcing vimrc file(s)
003.570  000.016  000.016: sourcing /usr/share/vim/vimfiles/ftdetect/lf.vim
003.628  000.183  000.167: sourcing /usr/share/nvim/runtime/filetype.lua
003.650  000.009  000.009: sourcing /usr/share/nvim/runtime/filetype.vim
003.755  000.048  000.048: sourcing /usr/share/nvim/runtime/syntax/synload.vim
003.833  000.163  000.115: sourcing /usr/share/nvim/runtime/syntax/syntax.vim
004.181  000.010  000.010: sourcing /usr/share/nvim/runtime/plugin/gzip.vim
004.197  000.007  000.007: sourcing /usr/share/nvim/runtime/plugin/health.vim
004.228  000.022  000.022: sourcing /usr/share/nvim/runtime/plugin/man.vim
004.245  000.007  000.007: sourcing /usr/share/nvim/runtime/plugin/matchit.vim
004.261  000.008  000.008: sourcing /usr/share/nvim/runtime/plugin/matchparen.vim
004.279  000.010  000.010: sourcing /usr/share/nvim/runtime/plugin/netrwPlugin.vim
004.368  000.005  000.005: sourcing /home/nullchilly/.local/share/nvim/rplugin.vim
004.372  000.085  000.080: sourcing /usr/share/nvim/runtime/plugin/rplugin.vim
004.418  000.036  000.036: sourcing /usr/share/nvim/runtime/plugin/shada.vim
004.436  000.007  000.007: sourcing /usr/share/nvim/runtime/plugin/spellfile.vim
004.454  000.009  000.009: sourcing /usr/share/nvim/runtime/plugin/tarPlugin.vim
004.469  000.006  000.006: sourcing /usr/share/nvim/runtime/plugin/tohtml.vim
004.488  000.011  000.011: sourcing /usr/share/nvim/runtime/plugin/tutor.vim
004.507  000.009  000.009: sourcing /usr/share/nvim/runtime/plugin/zipPlugin.vim
004.570  000.010  000.010: sourcing /usr/share/vim/vimfiles/plugin/fzf.vim
005.371  000.364  000.364: require('catppuccin')
005.451  000.074  000.074: require('catppuccin.config')
005.627  000.005  000.005: require('vim.F')
006.590  000.739  000.739: sourcing /home/nullchilly/.local/share/nvim/site/pack/packer/start/theme/colors/catppuccin.lua
006.777  000.026  000.026: sourcing /home/nullchilly/.local/share/nvim/site/pack/packer/opt/nvim-web-devicons/plugin/nvim-web-devicons.vim
007.540  000.069  000.069: require('lualine_require')
007.682  000.359  000.291: require('lualine')
008.159  000.036  000.036: require('catppuccin.utils.echo')
008.162  000.084  000.049: require('catppuccin.palettes.init')
008.197  000.033  000.033: require('catppuccin.palettes.mocha')
009.949  000.045  000.045: require('lualine.utils.mode')
009.984  002.972  002.450: require('config.lualine')
010.638  000.032  000.032: require('bufferline.lazy')
010.682  000.041  000.041: require('bufferline.constants')
010.789  000.105  000.105: require('bufferline.commands')
010.793  000.328  000.150: require('bufferline')
010.919  000.117  000.117: require('bufferline.utils')
011.104  000.181  000.181: require('bufferline.config')
011.182  000.065  000.065: require('bufferline.colors')
011.511  000.249  000.249: require('bufferline.groups')
011.646  000.113  000.113: require('bufferline.highlights')
012.224  002.069  001.016: require('config.bufferline')
012.284  007.671  001.423: sourcing /home/nullchilly/.config/nvim/plugin/packer_compiled.lua
012.445  000.776: loading rtp plugins
012.586  000.020  000.020: sourcing /home/nullchilly/.local/share/nvim/site/pack/packer/start/plenary.nvim/plugin/plenary.vim
012.697  000.233: loading packages
012.699  000.002: loading after plugins
012.706  000.007: inits 3
015.220  002.513: reading ShaDa
015.280  000.061: opening buffers
015.364  000.049  000.049: require('bufferline.state')
015.368  000.040: BufEnter autocommands
015.370  000.001: editing files in windows
015.371  000.002: VimEnter autocommands
015.373  000.001: UIEnter autocommands
015.373  000.001: before starting main loop
015.552  000.060  000.060: require('bufferline.pick')
015.634  000.080  000.080: require('bufferline.duplicates')
015.755  000.119  000.119: require('bufferline.diagnostics')
015.758  000.339  000.080: require('bufferline.buffers')
015.905  000.136  000.136: require('bufferline.models')
016.467  000.514  000.514: require('nvim-web-devicons')
017.840  000.361  000.361: require('bufferline.ui')
017.980  000.107  000.107: require('bufferline.numbers')
018.299  000.148  000.148: require('bufferline.sorters')
018.491  000.171  000.171: require('bufferline.tabpages')
018.625  000.108  000.108: require('bufferline.offset')
018.687  000.058  000.058: require('bufferline.custom_area')
019.508  000.587  000.587: require('vim.diagnostic')
019.858  001.956: first screen update
019.860  000.002: --- NVIM STARTED ---
```
