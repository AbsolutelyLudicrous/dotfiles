function bigTermOpen () {
	#run when we open a 'large' terminal
	echo $(date): opening large terminal >> ~/zshrcopenlog
	export ZSH_THEME='agnoster'
	repeat 8 echo
	neofetch
}

function smallTermOpen () {
	#run when we open a 'small' terminal
	echo $(date):  opening small terminal >> ~/zshrcopenlog
	export ZSH_THEME='bureau'
	ufetch || top -n 1  | head -n 5
}

function eclipseTermOpen () {
	#run when we're in Eclipse's terminal
	echo $(date): opening eclipse terminal >> ~/zshrcopenlog
	export ZSH_THEME='avit'
	cd $HOME/Documents/workspaces/javaWorkspace
}

function determinal () {
	#determines which terminal open functions to call
	width=$(tput cols)	#tput is weird
	height=$(tput lines)
	echo $(date): w:$width, h:$height >> ~/zshrcopenlog

	neofetch | grep -o -ie 'java' > /dev/null; 
	if [[ ($? -eq 0) ]];then;
		echo $(date): chose eclipse terminal >> ~/zshrcopenlog
		eclipseTermOpen;fi;

	if [[ (height -ge 32) && (width -ge 128) ]];then;
		echo $(date): chose big terminal >> ~/zshrcopenlog
		bigTermOpen;fi;
	if [[ (height -lt 32) && (width -lt 128) ]];then;
		echo $(date): chose small terminal >> ~/zshrcopenlog
		smallTermOpen;fi;
}

function lsalias () {
	#gives us the correct alias for ls
	#TODO make this functionalprogrammingier and return an alias, not directly manipulate the alias
	echo $(date): choosing ls-alias >> ~/zshrcopenlog
	uname -a | grep -o -ie 'bsd' > /dev/null
	if [[ ($? -eq 0) ]];then;	#if we're on the bsd box
		echo $(date): chose bsd ls-aliases >> ~/zshrcopenlog
		alias ls="ls -aG";	#equivalent to --all --color or -a --color
	else;				#if we're on the linux box(es)
		echo $(date): chose linux ls-aliases >> ~/zshrcopenlog
		alias ls="ls --all --color";fi;
}

function genericTermOpen () {
	#should get run everytime, greets the user
	echo $(date): performing generic terminal open >> ~/zshrcopenlog
	echo 'Welcome, '$USER
	echo 'The time is currently '$(date)
}

function termopen () {
	#calls all the other terminal opener functions
	sleep 0.2	#needed because tilda likes to 'open' at 80*24 and then resize itself
	ps -p $(ps -p $$ -o ppid=) o args= >> ~/zshrcopenlog	#get terminal name, courtesy of https://askubuntu.com/questions/476641/how-can-i-get-the-name-of-the-current-terminal-from-command-line
	determinal
	lsalias
	genericTermOpen
	echo $(date): terminal open finished >> ~/zshrcopenlog
	echo ''>> ~/zshrcopenlog
	rm zshrcopenlog	#if we don't want to debug the terminal
}
termopen

#aliases
alias grep='grep --color'
alias ssh='ssh -v'
alias clear='clear && . ~/.zshrc'	#pretends we have a new terminal
alias df='df -h'
alias 'maven'='mvn'
alias 'v'='nvim'
alias vim='nvim'
alias vi='nvim'
alias emacs='nvim' #Muahahahahaahhaahaahahahaahhahaa!
alias 'fuck'='sudo $(fc -ln -1)';alias 'redo'='sudo $(fc -ln -1)'
alias vlock="echo fucked up for now, don\'t try it"
alias 'py'='python'
alias 'py3'='python3'
alias 'book'='BOOKMARK=$(pwd)'	#bookmarking util, set a bookmark with 'book', switch to that bookmark with 'cd book'

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
	source $HOME/zsh-autosuggestions/zsh-autosuggestions.zsh	#when we aren't in Arch
fi
source $HOME/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh







