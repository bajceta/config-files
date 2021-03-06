# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"
# ZSH_THEME="agnoster"

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
plugins=(git wd npm vi-mode)

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
alias gd="git diff --color --histogram --word-diff"
alias ll="ls -ltr"
alias gll="git log --oneline --graph --all --decorate --color"
alias gs="git status -b -s"
alias ts="trans sv:en "
alias gpg="gpg2"
branch()  {
    git checkout master && (git branch -D $1 || 1 ) &&  git fetch && git checkout -t origin/$1
}

if [ "$0" = "/usr/sbin/lightdm-session" -a "$DESKTOP_SESSION" = "i3" ]; then
    export $(gnome-keyring-daemon -s)
fi

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

# Create agent folder
if [ ! -d $HOME/.ssh/agent ]; then
        mkdir -p $HOME/.ssh/agent
fi

# Start an agent if there isn't one running already.
HOSTNAME=$(hostname)
pid=`ps -u$LOGNAME | grep ssh-age | awk '{print $1}'`
if [ -z "$pid" ]; then
    echo "create agent folder"
        AGENT=$(ssh-agent -s)
        echo $AGENT | grep -v echo > $HOME/.ssh/agent/$HOSTNAME & pid=$!
        sleep 0.4 # Let it fork and stuff
fi

source $HOME/.ssh/agent/$HOSTNAME
ssh-add -l | grep "The agent has no identities" && ssh-add

export VISUAL=vim
export EDITOR="$VISUAL"
export PATH="$HOME/bin:/usr/lib/postgresql/9.5/bin/:/usr/local/go/bin:$PATH"
# export PATH=$PATH:/usr/local/go/bin

export ANDROID_HOME=/opt/android
# ZSH_THEME_GIT_PROMPT_SUFFIX=''
# ZSH_THEME_GIT_PROMPT_DIRTY='NOK'
# ZSH_THEME_GIT_PROMPT_CLEAN='OK'
#local ret_status="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ )"
#PROMPT='${ret_status} %{$fg[cyan]%}%c%{$reset_color%} $(git_prompt_info)'

# PD="%{$fg[blue]%}|"
# ZSH_THEME_GIT_PROMPT_PREFIX="$PD%{$fg[red]%}"
#ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
# ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg_bold[yellow]%}*"
# ZSH_THEME_GIT_PROMPT_CLEAN=""
#http://zsh.sourceforge.net/Doc/Release/Prompt-Expansion.html
# PROMPT='%{$fg_bold[white]%}%M$PD%{$fg_bold[white]%}%*$PD%{$fg[cyan]%}%22d%{$fg_bold[blue]%}$(git_prompt_info) %{$fg_bold[blue]%}%{$fg_bold[white]> %{$reset_color%}'
#PROMPT='%{$fg_bold[white]%}%M %{$fg_bold[red]%}➜ %{$fg_bold[green]%}%p %{$fg[cyan]%}%c; ;'


# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /home/vlada/.config/yarn/global/node_modules/tabtab/.completions/serverless.zsh ]] && . /home/vlada/.config/yarn/global/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /home/vlada/.config/yarn/global/node_modules/tabtab/.completions/sls.zsh ]] && . /home/vlada/.config/yarn/global/node_modules/tabtab/.completions/sls.zsh
unset DOCKER_HOST
