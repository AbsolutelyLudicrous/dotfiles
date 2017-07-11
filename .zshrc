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

#environ vars
export EDITOR=nvim
export VISUAL=nvim
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=32

#options
setopt interactivecomments
setopt dotglob

#functions
SHELL_MACRO_LOCATION=$HOME/Documents/dotfiles/shell-macros	#set this to wherever your macros are
open()					{ $SHELL_MACRO_LOCATION/open.sh $@;		}
upmusic()				{ $SHELL_MACRO_LOCATION/upmusic.sh $@;		}
man()					{ $SHELL_MACRO_LOCATION/man.sh $@;		}
alias 'music'='muse'; muse()		{ $SHELL_MACRO_LOCATION/muse.sh $@;		}
alias 'bs'='brightset'; brightset()	{ $SHELL_MACRO_LOCATION/brightset.sh $@;	}
alias 'bd'='brightdown'; brightdown()	{ $SHELL_MACRO_LOCATION/brightdown.sh $@;	}
alias 'bu'='brightup'; brightup()	{ $SHELL_MACRO_LOCATION/brightup.sh $@;		}
alias 'dj'='dadjoke'; dadjoke()		{ $SHELL_MACRO_LOCATION/dadjoke.sh $@;		}
FIXME()					{ $SHELL_MACRO_LOCATION/FIXME.sh $@;		}

# ^^	Mason-Generated	^^
# vv	Auto-generated	vv

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
  export ZSH=/home/masondanne/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
#agnoster requires a powerline font, bureau works OOTB.
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
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh	#fish-style autocompletion, available from https://github.com/zsh-users/zsh-autosuggestions

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
