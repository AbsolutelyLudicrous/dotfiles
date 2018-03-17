#needed exclusively for creating the $ZDOTDIR env var
#unfortunately, ~/.zsh-update still stays in $HOME
#//TODO bitch to robyrussel that they need to not clutter up my home so much
export ZDOTDIR=$HOME/.zsh
export HISTFILE=$ZDOTDIR/zhistory	#omzsh plugin thing
source $ZDOTDIR/.zshrc

#environ vars
export ZDOTDIR="$HOME/.zsh"		#where the heck we have our zsh dotfiles
export HISTFILE=$ZDOTDIR/zhistory	#where the heck our zshhistory is stored
export EDITOR=nvim			#editor
export VISUAL=nvim			#editor
export ZSH=$ZDOTDIR/.oh-my-zsh		#path to OMZSH install
export UPDATE_ZSH_DAYS=32		#update OMZSH every 32 days
export PAGER=less			#less is more
export ATOM_HOME=$HOME/.config/Atom	#motherfucking atom not conforming to the xdg base spec
export PLAYLIST_UUID=PLU6u2aLdEBuM9rIqFJnmgfWQtng47Wa1D	#the unique ID of our music playlist
export DOCS=docs			#location of Documents folder
export ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=32	#how many lines of zhistory should be read
export CASE_SENSITIVE='false'			#do we use case-sensitive completion
export HYPHEN_INSENSITIVE='true'		#don't differentiate between hyphens and underscores
export DISABLE_AUTO_UPDATE='false'		#continue to auto-update OMZSH
export DISABLE_LS_COLORS='true'		#removes a preconfigured alias, we want to use our own
export ENABLE_CORRECTION='true'		#enable command autocorrect
export COMPLETION_WAITING_DOTS='true'		#give us small red dots while waiting for tab completion
export HIST_STAMPS='dd.mm.yyyy'		#date format
export kdedev='3cfe9a26dcaa3f71'		#ID of my cellphone as determined by KDEConnect, used for running kdeconnect-cli
export nb='⚨'	#I feel like I might have to type this a lot
