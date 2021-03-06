#buncha nonsense functions up here, the real zshrc begins around line 80

DEBUG=false
dump=/dev/null	#location to throw all our garbage at, set to $ZDOTDIR/zshrcopenlog for debugging

function bigTermOpen () {
	#run when we open a 'large' terminal
	if $DEBUG; then; echo $(date): opening large terminal >> $ZDOTDIR/zshrcopenlog;fi
	export ZSH_THEME='agnoster'
	repeat 8 echo
	neofetch
}

function smallTermOpen () {
	#run when we open a 'small' terminal
	if $DEBUG; then; echo $(date):  opening small terminal >> $ZDOTDIR/zshrcopenlog;fi
	export ZSH_THEME='amuse'
	ufetch 2>> $dump	#on the off chance we have ufetch installed
}

function determinal () {
	#determines which terminal open functions to call
	width=$(tput cols)	#tput is weird
	height=$(tput lines)
	if $DEBUG; then; echo $(date): w:$width, h:$height >> $ZDOTDIR/zshrcopenlog;fi

	# neofetch | grep -o -ie 'java' > $dump; 
	# if [[ ($? -eq 0) ]];then;
	# 	echo $(date): chose eclipse terminal >> $ZDOTDIR/zshrcopenlog
	# 	eclipseTermOpen;fi;

	if [[ (height -ge 32) && (width -ge 128) ]];then;
		if $DEBUG; then; echo $(date): chose big terminal >> $ZDOTDIR/zshrcopenlog;fi
		bigTermOpen;
	# if [[ (height -lt 32) && (width -lt 128) ]];then;
	else;
		if $DEBUG; then; echo $(date): chose small terminal >> $ZDOTDIR/zshrcopenlog;fi
		smallTermOpen;fi;
}

function userlandCompat () {
	#gives us the correct alias for ls, aliases neofetch to screenfetch on non-neofetch systems
	#//TODO make this functionalprogrammingier and return an alias, not directly manipulate the alias
	if $DEBUG; then; echo $(date): choosing ls-alias >> $ZDOTDIR/zshrcopenlog;fi
	uname -a | grep -o -ie 'bsd' -o -ie 'darwin' > $dump
	if [[ ($? -eq 0) ]];then;	#if we're on the bsd box
		if $DEBUG; then; echo $(date): chose bsd ls-aliases >> $ZDOTDIR/zshrcopenlog;fi
		alias ls="ls -aG";	#equivalent to --all --color or -a --color
	else;				#if we're on the linux box(es)
		if $DEBUG; then; echo $(date): chose linux ls-aliases >> $ZDOTDIR/zshrcopenlog;fi
		alias ls="ls --all --color --classify";fi;
	# neofetch > $dump || alias 'neofetch'='screenfetch -p'	#not all systems have neofetch, so we set it to screenfetch instead
}

function genericTermOpen () {
	#should get run everytime, greets the user
	if $DEBUG; then; echo $(date): performing generic terminal open >> $ZDOTDIR/zshrcopenlog;fi
	echo 'Welcome, '$USER
	echo 'The time is currently '$(date)
}

function termopen () {
	#calls all the other terminal opener functions
	\clear					#for some reason, the zshrc likes to run twice. //TODO not be lazy and fix that, instead of just pushing the problem off to the side
	\rm $ZDOTDIR/zshrcopenlog 2>> $dump		#remove a previous logfile
	sleep 0.3				#needed because tilda likes to 'open' at 80*24 and then resize itself
	if $DEBUG; then; ps -p $(ps -p $$ -o ppid=) -o args= >> $ZDOTDIR/zshrcopenlog;fi	#get terminal name, courtesy of https://askubuntu.com/questions/476641/how-can-i-get-the-name-of-the-current-terminal-from-command-line
	determinal
	userlandCompat
	genericTermOpen
	if $DEBUG; then; echo $(date): terminal open finished >> $ZDOTDIR/zshrcopenlog;fi
	if $DEBUG; then; echo ''>> $ZDOTDIR/zshrcopenlog;fi	#adds a newline for better read flow
}
termopen

#script wrappers
function ghc () {
	echo $@
	for current in $@; do
		bash -c "
		ghc -fno-warn-tabs -o $current.compiled -outputdir=./.⚨-haskellstubs $current"	#I ⚢ Unicode!
	done;}

function ghci () {
	sh -c "
	ghci -fno-warn-tabs $@
	\rm -r $HOME/.ghc";}	#it's dumb that ghci doesn't have an off switch for its history

#options
setopt interactivecomments
setopt dotglob

#path additions
PATH="$PATH:$HOME/dotfiles/bin"

#plugins; may be added to $ZDOTDIR/.oh-my-zsh/custom/plugins/
plugins=(git catimg)

#sourcing shenaninigans
#add zsh aliases
source $ZDOTDIR/.zshaliases 2>> $dump

#add OMZSH ricing
source $ZSH/oh-my-zsh.sh 2>> $dump

#fish-style autosuggestions
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh 2>> $dump
source $ZDOTDIR/zsh-autosuggestions/zsh-autosuggestions.zsh 2>> $dump

#in-shell syntax highlighting
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>> $dump
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>> $dump
source $ZDOTDIR/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>> $dump

#directory-change hook, courtesy of https://stackoverflow.com/questions/17051123/source-a-file-in-zsh-when-entering-a-directory
autoload -U add-zsh-hook
load-local-conf() {
	# check file exists, is regular file and is readable:
	if [[ -f .dir-dot-dae && -r .dir-dot-dae ]]; then
		source .dir-dot-dae
	fi
}
add-zsh-hook chpwd load-local-conf
