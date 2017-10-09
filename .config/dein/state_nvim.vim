if g:dein#_cache_version != 100 | throw 'Cache loading error' | endif
let [plugins, ftplugin] = dein#load_cache_raw(['/home/masondanne/Documents/dotfiles/.config/nvim/init.vim'])
if empty(plugins) | throw 'Cache loading error' | endif
let g:dein#_plugins = plugins
let g:dein#_ftplugin = ftplugin
let g:dein#_base_path = '/home/masondanne/.config/dein'
let g:dein#_runtime_path = '/home/masondanne/.config/dein/.cache/init.vim/.dein'
let g:dein#_cache_path = '/home/masondanne/.config/dein/.cache/init.vim'
let &runtimepath = '/home/masondanne/.config/nvim,/etc/xdg/nvim,/home/masondanne/.local/share/nvim/site,/usr/local/share/nvim/site,/home/masondanne/.config/dein/repos/github.com/Shougo/dein.vim,/home/masondanne/.config/dein/.cache/init.vim/.dein,/usr/share/nvim/site,/usr/share/nvim/runtime,/home/masondanne/.config/dein/.cache/init.vim/.dein/after,/usr/share/nvim/site/after,/usr/local/share/nvim/site/after,/home/masondanne/.local/share/nvim/site/after,/etc/xdg/nvim/after,/home/masondanne/.config/nvim/after'
filetype off
