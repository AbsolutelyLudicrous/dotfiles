"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/home/danne/.config/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('/home/danne/.config/dein')
  call dein#begin('/home/danne/.config/dein')

  " Let dein manage dein
  " Required:
  call dein#add('/home/danne/.config/dein/repos/github.com/Shougo/dein.vim')

  call dein#add('vim-airline/vim-airline')		"Fancy bottom bar
  call dein#add('vim-airline/vim-airline-themes')	"Themes for airline

  call dein#add('Shougo/neco-syntax')			"Fancy multi-language completion
 "call dein#add('zchee/deoplete-jedi')			"Python! TODO unfuckulate it
  call dein#add('fszymanski/deoplete-emoji')		"Because emojis aren't prevalent enough
   call deoplete#custom#set('emoji', 'filetypes', ['gitcommit','markdown','rst','plaintext'])
  call dein#add('airblade/vim-gitgutter')

  "Deoplete, a completion engine
  call dein#add('Shougo/deoplete.nvim')
  if !has('nvim')
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
  endif

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
let g:deoplete#enable_at_startup = 1	"turn on deoplete
let mapleader = "-"

set number			"add line numbers
"set relativenumber		"in conjunction with above, show abs number on current line and show rel number
set nowrap			"don't wrap text
"filetype indent plugin on	"indent based on filetype
set autoindent			"automatically indent
set visualbell			"don't play a sound when I balls up
set nobackup			"dont make .fileextension~ files
"set backupdir=~/foo/bar/baz	"backup directory, if the above is turned off
"set clipboard=unnamedplus	"enable copy/pasting in and out of Vim
set clipboard+=unnamedplus	"neovim style
set noexpandtab			"use tabs, not spaces
"set mouse=a			"enable mouse usage
set showcmd			"show commands

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

"run current buffer
"https://stackoverflow.com/questions/15449591/vim-execute-current-file
nnoremap <leader>r :!"%:p"
