
# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="robbyrussell"
#ZSH_THEME="dpoggi"
ZSH_THEME="agnoster"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how many often would you like to wait before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
#plugins=(git)
plugins=(git osx autojump python pip github gnu-utils history-substring-search zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...

# tmuxinator
[[ -s $HOME/.tmuxinator/scripts/tmuxinator ]] && source $HOME/.tmuxinator/scripts/tmuxinator

# tmux를 실행할 경우 .zshrc가 다시 실행된다.
# http://stackoverflow.com/questions/13058578/how-to-prevent-tmux-from-filling-up-the-global-path-variable-with-duplicated-pat
if [[ -z $TMUX ]]; then
  # for tmuxinator
  export EDITOR=vim

  export PATH=/usr/local/sbin:/usr/local/bin:$PATH
  export PATH=/Users/yhbyun/bin:$PATH
  export JAVA_HOME=/Library/Java/home
  export HADOOP_HOME=/Users/yhbyun/Apps/hadoop-0.20.203.0
  export ANT_HOME=/usr/share/ant
  export M2_HOME=/usr/share/maven
  export MONGODB_HOME=/Users/yhbyun/Apps/mongodb-osx-x86_64-1.8.1
  export PATH=$JAVA_HOME/bin:$HADOOP_HOME/bin:$ANT_HOME/bin:$M2_HOME/bin:$PATH:$MONGODB_HOME/bin
  #export PATH=/Applications/MAMP/bin/php/php5.3.14/bin:$PATH

  # Google Go Lang Vars
  export GOROOT=$HOME/go
  export GOOS=darwin
  #export GOARCH=386
  export GOARCH=amd64
  export GOBIN=$HOME/bin
  export PATH=$GOBIN:$PATH

  export NODE_PATH="/usr/local/lib/node:/usr/local/lib/node_modules"
  export PATH=/usr/local/share/npm/bin:$PATH

  #nginx
  export PATH=/usr/local/nginx/sbin:$PATH

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

source ~/bin/tmuxinator.zsh

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
source ~/.zprofile # force source .zprofile. I don't know why not called


#preexec() { echo "yhbyun" }

# 오른쪽 prompt
#RPROMPT='%{$fg[cyan]%} [$(date +%T)][$(~/.rvm/bin/rvm-prompt)]%{$reset_color%}'
RPROMPT='%{$fg[cyan]%} [$(date +%T)]%{$reset_color%}'


# Colors vary depending on time lapsed.
ZSH_THEME_GIT_TIME_SINCE_COMMIT_SHORT="%{$fg[green]%}"
ZSH_THEME_GIT_TIME_SHORT_COMMIT_MEDIUM="%{$fg[yellow]%}"
ZSH_THEME_GIT_TIME_SINCE_COMMIT_LONG="%{$fg[red]%}"
ZSH_THEME_GIT_TIME_SINCE_COMMIT_NEUTRAL="%{$fg[cyan]%}"
 
#Customized git status, oh-my-zsh currently does not allow render dirty status before branch
git_custom_status() {
  local cb=$(current_branch)
  if [ -n "$cb" ]; then
    echo "$(parse_git_dirty)$ZSH_THEME_GIT_PROMPT_PREFIX$(current_branch)$ZSH_THEME_GIT_PROMPT_SUFFIX"
  fi
}
 
# Determine the time since last commit. If branch is clean,
# use a neutral color, otherwise colors will vary according to time.
function git_time_since_commit() {
    if git rev-parse --git-dir > /dev/null 2>&1; then
        # Only proceed if there is actually a commit.
        if [[ $(git log 2>&1 > /dev/null | grep -c "^fatal: bad default revision") == 0 ]]; then
            # Get the last commit.
            last_commit=`git log --pretty=format:'%at' -1 2> /dev/null`
            now=`date +%s`
            seconds_since_last_commit=$((now-last_commit))
 
            # Totals
            MINUTES=$((seconds_since_last_commit / 60))
            HOURS=$((seconds_since_last_commit/3600))
 
            # Sub-hours and sub-minutes
            DAYS=$((seconds_since_last_commit / 86400))
            SUB_HOURS=$((HOURS % 24))
            SUB_MINUTES=$((MINUTES % 60))
 
            if [[ -n $(git status -s 2> /dev/null) ]]; then
                if [ "$MINUTES" -gt 30 ]; then
                    COLOR="$ZSH_THEME_GIT_TIME_SINCE_COMMIT_LONG"
                elif [ "$MINUTES" -gt 10 ]; then
                    COLOR="$ZSH_THEME_GIT_TIME_SHORT_COMMIT_MEDIUM"
                else
                    COLOR="$ZSH_THEME_GIT_TIME_SINCE_COMMIT_SHORT"
                fi
            else
                COLOR="$ZSH_THEME_GIT_TIME_SINCE_COMMIT_NEUTRAL"
            fi
 
            if [ "$HOURS" -gt 24 ]; then
                echo "($COLOR${DAYS}d${SUB_HOURS}h${SUB_MINUTES}m%{$reset_color%})"
            elif [ "$MINUTES" -gt 60 ]; then
                echo "($COLOR${HOURS}h${SUB_MINUTES}m%{$reset_color%})"
            else
                echo "($COLOR${MINUTES}m%{$reset_color%})"
            fi
        fi
    fi
}
 
# Just add $(git_time_since_commit) to your ZSH PROMPT and you're set
 
 
ZSH_THEME_GIT_PROMPT_PREFIX="%{$reset_color%}%{$fg[green]%}["
ZSH_THEME_GIT_PROMPT_SUFFIX="]%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}*%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""
 
 
#if [[ -s ~/.rvm/scripts/rvm ]] ; then
#  RPROMPT='$(git_time_since_commit)|$(git_custom_status)%{$fg[white]%}[`~/.rvm/bin/rvm-prompt`][node `node -v`]%{$reset_color%} $EPS1'
#else
#  RPROMPT='$(git_time_since_commit)|$(git_custom_status) $EPS1'
#fi
 
function get_pwd() {
  echo "${PWD/$HOME/~}"
}
 
#PROMPT='
#%{$fg[cyan]%}[%~% ]
#%{$fg[magenta]%}%n%{$reset_color%} at %{$fg[yellow]%}%m%{$reset_color%} %B$%b '

# Save a smiley to a local variable if the last command exited with success.
#local smiley="%(?,%{$fg[green]%}☺%{$reset_color%},%{$fg[red]%}☹%{$reset_color%})"

# Show the relative path on one line, then the smiley.
#PROMPT='
#%~
#${smiley}  %{$reset_color%}'


export LC_ALL=en_US.UTF-8  
export LANG=en_US.UTF-8

alias ftp-wiki='sftp -o "Port 32567" wki.ecplaza.net'
alias ssh-wiki='ssh wki.ecplaza.net -p 32567'
alias smb-mount='mount -t smbfs //yhbyun:sumin1004@192.168.56.110/inetpub ~/work/vagrant/win2k-dev/inetpub'
alias crontab="VIM_CRONTAB=true crontab"

#shell에서 vi 키바인딩 
set -o vi


[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

[[ -s $HOME/.nvm/nvm.sh ]] && . $HOME/.nvm/nvm.sh # This loads NVM
