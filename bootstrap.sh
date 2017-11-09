#!/bin/sh

git --version || terminate()
function terminate(){
	echo Git is not installed!
	echo '(how did you even clone this repo?)'
	echo Please install Git.;}

echo Temporarily installing unipkg, the unified package manager frontend.
git clone https://github.com/AbsolutelyLudicrous/unipkg.git
chmod 777 ./unipkg/unipkg.sh

pk=./unipkg/unipkg.sh

$pk install zsh
$pk install neovim
$pk install zsh-syntax-highlighting 2> /dev/null	#we don't care about this failing, we'll just clone the repo otherwise
