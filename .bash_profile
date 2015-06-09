[[ -s ~/.bashrc ]] && source ~/.bashrc
 
parse_git_branch() {

    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'

}

export CLICOLOR=1
#export LSCOLORS=GxFxCxDxBxegedabagaced
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

alias subl='/Applications/Sublime\ Text\ 2.app/Contents/SharedSupport/bin/subl'
alias ls='ls -Fh'
alias composer="php /usr/bin/composer.phar"
alias vm="ssh vagrant@127.0.0.1 -p 2222"
alias cda="composer dumpautoload"
alias behat="vendor/bin/behat"
alias google-chrome="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome"
alias fuck='eval $(thefuck $(fc -ln -1)); history -r'
# You can use whatever you want as an alias, like for Mondays:
alias FUCK='fuck'
alias vim='mvim -v'
alias vi='mvim -v'

test -f ~/.git-completion.bash && . $_

function prompt {
  local BLACK="\[\033[0;30m\]"
  local BLACKBOLD="\[\033[1;30m\]"
  local RED="\[\033[0;31m\]"
  local REDBOLD="\[\033[1;31m\]"
  local GREEN="\[\033[0;32m\]"
  local GREENBOLD="\[\033[1;32m\]"
  local YELLOW="\[\033[0;33m\]"
  local YELLOWBOLD="\[\033[1;33m\]"
  local BLUE="\[\033[0;34m\]"
  local BLUEBOLD="\[\033[1;34m\]"
  local PURPLE="\[\033[0;35m\]"
  local PURPLEBOLD="\[\033[1;35m\]"
  local CYAN="\[\033[0;36m\]"
  local CYANBOLD="\[\033[1;36m\]"
  local WHITE="\[\033[0;37m\]"
  local WHITEBOLD="\[\033[1;37m\]"
  local RESETCOLOR="\[\e[00m\]"
 
  export PS1="\n$RED\u $PURPLE@ $GREEN\H\n $BLUE[\w]\[\033[32m\]\$(parse_git_branch)\[\033[00m\] → $RESETCOLOR"
  export PS2="| → $RESETCOLOR"
}
 
prompt
