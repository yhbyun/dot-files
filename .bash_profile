# aliases
#alias ls='ls -FGw'

# OSX ls option
export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

# paths
PATH=/Users/yhbyun/bin:$PATH:usr/local/bin
export JAVA_HOME=/Library/Java/home
export HADOOP_HOME=/Users/yhbyun/Apps/hadoop-0.20.203.0
export ANT_HOME=/usr/share/ant
export M2_HOME=/usr/share/maven
export MONGODB_HOME=/Users/yhbyun/Apps/mongodb-osx-x86_64-1.8.1
export PATH=$JAVA_HOME/bin:$HADOOP_HOME/bin:$ANT_HOME/bin:$M2_HOME/bin:$PATH:$MONGODB_HOME/bin
export PATH=/Applications/MAMP/bin/php/php5.3.14/bin:$PATH
#export PATH=/Applications/MAMP/bin/php/php5.4.4/bin:$PATH

# Google Go Lang Vars
export GOROOT=$HOME/go
export GOOS=darwin
#export GOARCH=386
export GOARCH=amd64
export GOBIN=$HOME/bin
export PATH=$GOBIN:$PATH

export NODE_PATH="/usr/local/lib/node:/usr/local/lib/node_modules"
export PATH=/usr/local/share/npm/bin:$PATH

# MacPorts
#export PATH=/opt/local/bin:/opt/local/sbin:$PATH
#export MANPATH=/opt/local/share/man:$MANPATH

# zsh 을 위해서 
PATH="/usr/local/bin:/usr/local/sbin:$PATH"

# define colors
C_DEFAULT="\[\033[m\]"
C_WHITE="\[\033[1m\]"
C_BLACK="\[\033[30m\]"
C_RED="\[\033[31m\]"
C_GREEN="\[\033[32m\]"
C_YELLOW="\[\033[33m\]"
C_BLUE="\[\033[34m\]"
C_PURPLE="\[\033[35m\]"
C_CYAN="\[\033[36m\]"
C_LIGHTGRAY="\[\033[37m\]"
C_DARKGRAY="\[\033[1;30m\]"
C_LIGHTRED="\[\033[1;31m\]"
C_LIGHTGREEN="\[\033[1;32m\]"
C_LIGHTYELLOW="\[\033[1;33m\]"
C_LIGHTBLUE="\[\033[1;34m\]"
C_LIGHTPURPLE="\[\033[1;35m\]"
C_LIGHTCYAN="\[\033[1;36m\]"
C_BG_BLACK="\[\033[40m\]"
C_BG_RED="\[\033[41m\]"
C_BG_GREEN="\[\033[42m\]"
C_BG_YELLOW="\[\033[43m\]"
C_BG_BLUE="\[\033[44m\]"
C_BG_PURPLE="\[\033[45m\]"
C_BG_CYAN="\[\033[46m\]"
C_BG_LIGHTGRAY="\[\033[47m\]"

# Terminal colours (after installing GNU coreutils)
NM="\[\033[0;38m\]" #means no background and white lines
HI="\[\033[0;37m\]" #change this for letter colors
HII="\[\033[0;31m\]" #change this for letter colors
SI="\[\033[0;33m\]" #this is for the current directory
IN="\[\033[0m\]"

# export PS1="\n$C_LIGHTGREEN\u$C_DARKGRAY@$C_BLUE\h $C_DARKGRAY: $C_LIGHTYELLOW\w\n$C_DARKGRAY\$$C_DEFAULT "
export PS1="$NM[ $HI\u $HII\h $SI\w$NM ] $IN"
PS1="$PS1"'$([ -n "$TMUX" ] && tmux setenv TMUXPWD_$(tmux display -p "#D" | tr -d %) "$PWD")'

if [ "$TERM" != "dumb" ]; then
  export LS_OPTIONS='--color=auto'
  eval `gdircolors ~/.dir_colors`
fi

# Useful aliases
alias ls='gls $LS_OPTIONS -hF'
alias ll='gls $LS_OPTIONS -lhF'
alias l='gls $LS_OPTIONS -lAhF'

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

[[ -s $HOME/.nvm/nvm.sh ]] && . $HOME/.nvm/nvm.sh # This loads NVM

export PATH="/Users/yhbyun/Library/Application Support/GoodSync":$PATH