#!/usr/bin/env sh

DOTFILES=$HOME/dotfiles	#default dotfiles install directory

echo Running bootstrap script AS ROOT
echo The bootstrapper ensures that all required dependencies are installer

sudo ./bootstrap.sh

echo Running user-specific installer

echo Linking ~/.config and ~/.conky directorys
ln -s $DOTFILES/.config $HOME/.config
ln -s $DOTFILES/.conky $HOME/.conky

echo Linking zsh directorys
ln -s $DOTFILES/.zsh/.zshenv $HOME/.zshenv
ln -s $DOTFILES/.zsh $HOME/.zsh

echo Proceeding with shell ricing

#https://github.com/Shougo/dein.vim
echo Installing Dein plugin manager
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
sh ./installer.sh $HOME/.config/dein
rm installer.sh

#oh-my-zsh
echo Installing oh-my-zsh
git clone https://github.com/robbyrussell/oh-my-zsh.git $HOME/.zsh/oh-my-zsh
ln -s $DOTFILES/.zsh/oh-my-zsh $DOTFILES/.zsh/.oh-my-zsh	#other people suck and refuse to conform to my standard, which is quite clearly superior

#zsh-autosugg
echo Installing zsh-autosuggesstions
git clone git://github.com/zsh-users/zsh-autosuggestions $DOTFILES/.zsh/zsh-autosuggestions

#zsh-syntax-highlighting
echo Installing zsh-syntax-highlighting
pkg show zsh-syntax-highlighting || \
	git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $DOTFILES/.zsh/zsh-syntax-highlighting
	#Just Works!(tm) on freebsd, manually clones repo on other systems
	#zsh-syn should have been installed by the bootstrapper

echo "If you got an error along the lines of:
	\tfatal: destination path '/home/danne/.zsh/oh-my-zsh' already exists and is not an empty directory."
echo	"Don't panic!
	It's fine, it just means you had some pre-existing files."

echo "	Note: Dein is fucky.
	Make sure you run a :call dein#install() and a :UpdateRemotePlugins once you're in NeoViM.
	Seriously, dein just won't work if you don't run those commands."
