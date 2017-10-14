#needed exclusively for creating the $ZDOTDIR env var
#unfortunately, ~/.zsh-update still stays in $HOME
#//TODO bitch to robyrussel that they need to not clutter up my home so much
export ZDOTDIR=$HOME/.zsh
export HISTFILE=$ZDOTDIR/zhistory	#omzsh plugin thing
source $ZDOTDIR/.zshrc
