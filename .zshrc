#greeting screen
repeat 8 echo
neofetch
echo 'Welcome, '$USER
echo 'The time is currently '$(date)

#aliases
alias ls='ls -a --color'
alias tyls='tyls -a -m' #Terminology's fancy-schmancy ls replacement
alias grep='grep --color'
alias ssh='ssh -v'
alias clear='clear && . ~/.zshrc'	#pretends we have a new terminal
alias df='df -h'
alias 'maven'='mvn'
alias vim='nvim'
alias vi='nvim'
alias emacs='nvim' #Muahahahahaahhaahaahahahaahhahaa!
alias 'fuck'='sudo $!!';alias 'redo'='sudo !!'

#environ vars
export EDITOR=nvim			#editor
export VISUAL=nvim			#editor
export ZSH=$HOME/.oh-my-zsh		#path to OMZSH install
export UPDATE_ZSH_DAYS=32		#update OMZSH every 32 days
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=32	#how lines of zhistory should be read
ZSH_THEME='agnoster' 			#or bureau. agnoster requires a powerline font, bureau works OOTB.
CASE_SENSITIVE='false'			#do we use case-sensitive completion
HYPHEN_INSENSITIVE='true'		#don't discriminate between hyphens and underscores
DISABLE_AUTO_UPDATE='false'		#continue to auto-update OMZSH
DISABLE_LS_COLORS='true'		#removes a preconfigured alias, we want to use our own
ENABLE_CORRECTION='true'		#enable command autocorrect
COMPLETION_WAITING_DOTS='true'		#give us small red dots while waiting for tab completion
HIST_STAMPS='dd.mm.yyyy'		#date format

#options
setopt interactivecomments
setopt dotglob

#functions
SHELL_MACRO_LOCATION=$HOME/Documents/dotfiles/shell-macros	#set this to wherever you cloned these macros
open()		{ $SHELL_MACRO_LOCATION/open.sh $@;		};
upmusic()	{ $SHELL_MACRO_LOCATION/upmusic.sh $@;		};
man()		{ $SHELL_MACRO_LOCATION/man.sh $@;		};
muse()		{ $SHELL_MACRO_LOCATION/muse.sh $@;		};alias 'music'='muse'
brightset()	{ $SHELL_MACRO_LOCATION/brightset.sh $@;	};alias 'bs'='brightset'
brightdown()	{ $SHELL_MACRO_LOCATION/brightdown.sh $@;	};alias 'bd'='brightdown'
brightup()	{ $SHELL_MACRO_LOCATION/brightup.sh $@;		};alias 'bu'='brightup'
dadjoke()	{ $SHELL_MACRO_LOCATION/dadjoke.sh $@;		};alias 'dj'='dadjoke'
FIXME()		{ $SHELL_MACRO_LOCATION/FIXME.sh $@;		};

#plugins; may be added to ~/.oh-my-zsh/custom/plugins/
plugins=(git)

#sourcing shenaninigans
source $ZSH/oh-my-zsh.sh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh	#fish-style autocompletion, available from https://github.com/zsh-users/zsh-autosuggestions
source /home/masondanne/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
