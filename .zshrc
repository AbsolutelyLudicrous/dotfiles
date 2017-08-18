#greeting screen
function termopen () {
	neofetch | grep 'tilda' > /dev/null
	if [[ ($? -eq 0) ]];then;	#if this is our desktop Tilda window
		export ZSH_THEME='agnoster' #or bureau. agnoster requires a powerline font, bureau works OOTB.
		alias ls='ls -a --color'
		repeat 8 echo
		neofetch
		gtop
	fi
	neofetch | grep 'java' > /dev/null
	if [[ ($? -eq 0) ]];then;	#if this is Eclipse's terminal
		cd $HOME/Documents/workspaces/javaWorkspace
		alias ls='ls -a --color'
		export ZSH_THEME='avit'
	fi
	neofetch | grep 'terminology' > /dev/null
	if [[ ($? -eq 0) ]];then;	#if this is Terminology
		export ZSH_THEME='agnoster' #or bureau. agnoster requires a powerline font, bureau works OOTB.
		alias ls='tyls -s -a'
		ufetch
	fi
	neofetch | grep 'gnome-term' > /dev/null
	if [[ ($? -eq 0) ]];then;	#if this is gnome-terminal
		export ZSH_THEME='bureau'
		alias ls='ls -a --color'
		ufetch || top -n 1 | head -n 5
	fi
	echo 'Welcome, '$USER
	echo 'The time is currently '$(date)
}
termopen

#aliases
alias grep='grep --color'
alias ssh='ssh -v'
alias clear='clear && . ~/.zshrc'	#pretends we have a new terminal
alias df='df -h'
alias 'maven'='mvn'
alias vim='nvim'
alias vi='nvim'
alias emacs='nvim' #Muahahahahaahhaahaahahahaahhahaa!
alias 'fuck'='sudo $(fc -ln -1)';alias 'redo'='sudo $(fc -ln -1)'

#environ vars
export EDITOR=nvim			#editor
export VISUAL=nvim			#editor
export ZSH=$HOME/.oh-my-zsh		#path to OMZSH install
export UPDATE_ZSH_DAYS=32		#update OMZSH every 32 days
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=32	#how many lines of zhistory should be read
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
function open()		{ $SHELL_MACRO_LOCATION/open.sh $@;		};
function upmusic()	{ $SHELL_MACRO_LOCATION/upmusic.sh $@;		};
function man()		{ $SHELL_MACRO_LOCATION/man.sh $@;		};
function muse()		{ $SHELL_MACRO_LOCATION/muse.sh $@;		};alias 'music'='muse'
function brightset()	{ $SHELL_MACRO_LOCATION/brightset.sh $@;	};alias 'bs'='brightset'
function brightdown()	{ $SHELL_MACRO_LOCATION/brightdown.sh $@;	};alias 'bd'='brightdown'
function brightup()	{ $SHELL_MACRO_LOCATION/brightup.sh $@;		};alias 'bu'='brightup'
function dadjoke()	{ $SHELL_MACRO_LOCATION/dadjoke.sh $@;		};alias 'dj'='dadjoke'
function termdate()	{ $SHELL_MACRO_LOCATION/termdate.sh $@;		};alias 'td'='termdate'
function FIXME()	{ $SHELL_MACRO_LOCATION/FIXME.sh $@;		};

#plugins; may be added to ~/.oh-my-zsh/custom/plugins/
plugins=(git)

#sourcing shenaninigans
source $ZSH/oh-my-zsh.sh
uname -a | grep --ignore-case arch > /dev/null
if [[ $? -eq 0 ]];then
	source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh	#fish-style autocompletion, available from https://github.com/zsh-users/zsh-autosuggestions
else
	source $HOME/zsh-autosuggestions/zsh-autosuggestions.zsh	#when we haven't installed via the AUR
fi
source $HOME/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh







