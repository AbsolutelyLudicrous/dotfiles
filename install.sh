#!/bin/bash

DOTFILES=$HOME/Documents/dotfiles	#default dotfiles install directory

echo Running install script, just make sure you have zsh and neovim installed

echo Linking ~/.config and ~/.conky directorys
ln -s $DOTFILES/.config $HOME/.config
ln -s $DOTFILES/.conky $HOME/.conky

echo Linking zsh directorys
ln -s $DOTFILES/.zshenv $HOME/.zshenv
ln -s $DOTFILES/.zsh $HOME/.zsh

#https://github.com/Shougo/dein.vim
echo Installing Dein plugin manager
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
sh ./installer.sh $HOME/.config/dein
rm installer.sh
