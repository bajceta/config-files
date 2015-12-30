# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="robbyrussell"
ZSH_THEME="agnoster"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git wd)

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

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
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

alias tm="tmuxomatic"
alias gd="git diff --color"
alias ll="ls -ltr"
alias gll="git log --oneline --graph --all --decorate --color"
alias gs="git status -b -s"
alias ts="trans sv:en "

if [ "$0" = "/usr/sbin/lightdm-session" -a "$DESKTOP_SESSION" = "i3" ]; then
    export $(gnome-keyring-daemon -s)
fi

#export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"

#export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
rvm use 2.2.3

# 
# o
#

alias login_production='ssh -i ~/.ssh/aws-portal-eu.pem ubuntu@ec2-54-155-65-10.eu-west-1.compute.amazonaws.com'

alias login_demo='ssh -i ~/.ssh/aws-portal-eu.pem ubuntu@ec2-54-228-130-178.eu-west-1.compute.amazonaws.com'

alias login_staging='ssh -i ~/.ssh/aws-portal-eu.pem ubuntu@staging.trialbee.com'
alias login_edge='ssh -i ~/.ssh/aws-portal-eu.pem ubuntu@ec2-54-155-15-12.eu-west-1.compute.amazonaws.com'
alias login_education='ssh -i ~/.ssh/aws-portal-eu.pem ubuntu@education.trialbee.com'

alias login_novo='ssh -i ~/.ssh/aws-portal-eu.pem ubuntu@ec2-54-220-233-184.eu-west-1.compute.amazonaws.com'

alias login_synargus='ssh -i ~/.ssh/aws-norma-synargus.pem ubuntu@ec2-50-17-21-234.compute-1.amazonaws.com'

alias login_synargus_prod1='ssh -i ~/.ssh/aws-norma-synargus-eu.pem ubuntu@ec2-54-74-23-2.eu-west-1.compute.amazonaws.com'
alias login_synargus_education='ssh -i ~/.ssh/aws-norma-synargus.pem ubuntu@ec2-54-198-107-149.compute-1.amazonaws.com'

alias login_synargus_demo='ssh -i ~/.ssh/aws-synargus-dev-eu.pem ubuntu@ec2-46-137-154-179.eu-west-1.compute.amazonaws.com'
alias login_synargus_dev='ssh -i ~/.ssh/aws-synargus-dev-eu.pem ubuntu@ec2-176-34-160-116.eu-west-1.compute.amazonaws.com'
alias login_synargus_scireg_demo='ssh -i ~/.ssh/synargus-scireg-eu.pem ubuntu@54.72.5.170'
alias login_synargus_scireg_prod='ssh -i ~/.ssh/synargus-scireg-eu.pem ubuntu@54.195.100.86'
                                                                     

alias login_synargus_version1='ssh -i ~/.ssh/aws-norma-synargus.pem ubuntu@ec2-184-72-131-107.compute-1.amazonaws.com'

export DOCKER_HOST=tcp://localhost:2375

