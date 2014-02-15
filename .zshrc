# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="robbyrussell"
ZSH_THEME="agnoster"


# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment this to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment following line if you want to  shown in the command execution time stamp 
# in the history command output. The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|
# yyyy-mm-dd
# HIST_STAMPS="mm/dd/yyyy"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin"
PATH="$(brew --prefix josegonzalez/php/php55)/bin:$PATH"

# export MANPATH="/usr/local/man:$MANPATH"

# # Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"


# tmuxinator
[[ -s $HOME/.tmuxinator/scripts/tmuxinator ]] && source $HOME/.tmuxinator/scripts/tmuxinator

# tmux를 실행할 경우 .zshrc가 다시 실행된다.
# http://stackoverflow.com/questions/13058578/how-to-prevent-tmux-from-filling-up-the-global-path-variable-with-duplicated-pat
if [[ -z $TMUX ]]; then
  # for tmuxinator
  export EDITOR=vim

else
  #tmux 상황
  #다음을 해야 /usr/bin 앞으로 /usr/local/bin이 설정된다.
  #이유는 모름 
  export PATH=/usr/local/bin:$PATH

fi

# agnoster 테마에서 user@hostname 보이지 않는 사용자 
export DEFAULT_USER=yhbyun

# ls alias
# ~/.oh-my-zsh/lib/aliases.zsh 에서 ls=ls -G 옵션으로 정의되어 있는데 -G
# 가 동작하지 않는 것 같음. color 옵션을 추가해서 재정의 
if [[ ! -z $TMUX ]]; then
  #alias ls='ls -F --color=auto'
  #alias ls='ls --color=auto'
  alias lsa='ls -lah'
  alias l='ls -lA1'
  alias ll='ls -l'
  alias la='ls -lA'
  alias sl=ls # often screw this up
fi

source ~/.bin/tmuxinator.zsh

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting


export LC_ALL=en_US.UTF-8  
export LANG=en_US.UTF-8

# tmux가 256 color로 표시되도록
alias tmux="TERM=screen-256color-bce tmux"

alias crontab="VIM_CRONTAB=true crontab"


# shell에서 vi 키바인딩 
set -o vi

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function

# promptline.vim 설정
# https://github.com/edkolev/promptline.vim
source ~/.shell_prompt.sh

