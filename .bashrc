# set the PS1
PS1='[\u@\h \W]\$ '

# history variables
export HISTCONTROL=ignoredups:erasedups
export HISTSIZE=100000
export HISTFILESIZE=$HISTSIZE

# include dotfiles in filename expansion
shopt -s dotglob

# update window size
shopt -s checkwinsize

# aliases
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

alias mv="mv -v"
alias rm="rm -v"
alias cp="cp -v"
alias mkdir="mkdir -p"

alias l="ls --color=auto"
alias ll="ls --color=auto -lah"
