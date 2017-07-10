#greeting screen
repeat 10 echo
neofetch
echo 'Welcome, '$USER
echo 'The time is currently '$(date)

#aliases
alias ls='ls -a --color'
alias tyls='tyls -a -m' #Terminology's fancy-schmancy ls replacement
alias grep='grep --color'
alias ssh='ssh -v'
alias clear='clear && neofetch'
alias df='df -h'
alias 'maven'='mvn'
alias vim='nvim'
alias vi='nvim'
alias emacs='nvim' #Muahahahahaahhaahaahahahaahhahaa!

#environ vars
export EDITOR=vim
export VISUAL=vim

#options
setopt interactivecomments

#function definitions
open(){
	#provide OSX-style file opening
	nautilus $1 & disown && echo
}

upmusic(){
	#redownload music playlist
	cd ~/Music
	youtube-dl https://www.youtube.com/playlist\?list=PLU6u2aLdEBuPrq2NydvfyTFW6nBOSr6c3\
		 --yes-playlist\
		 --no-call-home\
		 --ignore-config\
		 --no-overwrites
		# --embed-thumbnail - screwed for now
	./0\ convert.sh
	echo \'Music placed in $USER/Music.\'
}

man(){
	#Colored manpages
	#Credit goes to
	#https://github.com/da-edra/dotfiles 
	env \
		LESS_TERMCAP_mb=$(printf "\e[1;31m") \
		LESS_TERMCAP_md=$(printf "\e[1;31m") \
		LESS_TERMCAP_me=$(printf "\e[0m") \
		LESS_TERMCAP_se=$(printf "\e[0m") \
		LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
		LESS_TERMCAP_ue=$(printf "\e[0m") \
		LESS_TERMCAP_us=$(printf "\e[1;32m") \
		man "$@"
}

alias 'music'='muse'
muse(){
	#//TODO
	#Add some kind of Rhythmbox/Cava autostart config
	notify-send TODO
}

alias 'bs'='brightset'
brightset(){
	#Set the brightness via command line
	echo $(</root/assworld) | sudo -S\
	light -S $1 ||\
	echo 'An error occurred.  Did you input a value to be set?'
	echo $(</root/assworld) | sudo -S light -G
}

alias 'bd'='brightdown'
brightdown(){
	#Decrease brightness via command line
	echo $(</root/assworld) | sudo -S bash -c '
	light -U 10
	light -G
'}

alias 'bu'='brightup'
brightup(){
	#Increase brightness via command line
	echo $(</root/assworld) | sudo -S bash -c '
	light -A 10
	light -G
'}

alias 'dj'='dadjoke'
dadjoke(){
	curl -s https://icanhazdadjoke.com/
	echo #newline needed
}

FIXME(){
	#Used in my own shell scripts
	notify-send 'Process with ID '$$' is sending an SOS, fix it!'
}

# ^^	Mason-Generated	^^
# vv	Auto-generated	vv

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
  export ZSH=/home/masondanne/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME='agnoster' #or bureau

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
DISABLE_LS_COLORS="true"	#removes a preconfigured alias, we want to use our own

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="dd.mm.yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
