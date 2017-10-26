"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/home/masondanne/.config/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('/home/masondanne/.config/dein')
  call dein#begin('/home/masondanne/.config/dein')

  " Let dein manage dein
  " Required:
  call dein#add('/home/masondanne/.config/dein/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here:
  "call dein#add('Shougo/neosnippet.vim')
  "call dein#add('Shougo/neosnippet-snippets')
  call dein#add('vim-airline/vim-airline')
  call dein#add('vim-airline/vim-airline-themes')
  "call dein#add('Valloric/YouCompleteMe')

  " You can specify revision/branch/tag.
  "call dein#add('Shougo/vimshell', { 'rev': '3787e5' })

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
"filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------

let g:airline_theme='luna'
let g:airline_powerline_fonts = 1

set number			"add line numbers
set nowrap			"don't wrap text
syntax on			"syntax highlighting
"filetype indent plugin on	"indent based on filetype
set autoindent			"automatically indent
set visualbell			"don't play a sound when I balls up
set nobackup			"dont make .fileextension~ files
"set backupdir=~/foo/bar/baz	"backup directory, if the above is turned off
"set clipboard=unnamedplus	"enable copy/pasting in and out of Vim
set clipboard+=unnamedplus	"neovim style
set noexpandtab			"use tabs, not spaces
"set mouse=a			"enable mouse usage

"Keep undo history across sessions, by storing in file.
"courtesy of https://github.com/kristijanhusak/neovim-config/blob/master/init.vim
silent !mkdir ~/.config/nvim/backups > /dev/null 2>&1
set undodir=~/.config/nvim/backups
set undofile

set scrolloff=8		"start scrolling once we're 8 characters away from an edge
set sidescrolloff=15
set sidescroll=5

"Allow saving of files as sudo when I forgot to start vim using sudo.
"https://stackoverflow.com/questions/2600783/how-does-the-vim-write-with-sudo-trick-work
cmap w!! w !sudo tee > /dev/null %
