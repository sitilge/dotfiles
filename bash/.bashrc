# set the PS1
PS1='[\u@\h \W]\$ '

# enable vi key bindings
set -o vi

# set variables
export EDITOR=nvim
export VISUAL=nvim
export BROWSER=firefox
export TERM=linux
export HISTCONTROL=ignoredups:erasedups
export HISTSIZE=100000
export HISTFILESIZE=$HISTSIZE

# append to history
shopt -s histappend

# include dotfiles in filename expansion
shopt -s dotglob

# enable ** usage in filename expansion
shopt -s globstar

# update window size
shopt -s checkwinsize

# complete files and commands
complete -cf sudo

# aliases
alias e="nvim"

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

alias mv="mv -v"
alias rm="rm -vf"
alias cp="cp -v"
alias mkdir="mkdir -p"

alias ls="ls --color=auto"
alias l="ls --color=auto"
alias ll="l --color=auto -lah"

# set solarized colors for tty
if [ "$TERM" = "linux" ]; then
	echo -en "\e]PB657b83" # S_base00
	echo -en "\e]PA586e75" # S_base01
	echo -en "\e]P0073642" # S_base02
	echo -en "\e]P62aa198" # S_cyan
	echo -en "\e]P8002b36" # S_base03
	echo -en "\e]P2859900" # S_green
	echo -en "\e]P5d33682" # S_magenta
	echo -en "\e]P1dc322f" # S_red
	echo -en "\e]PC839496" # S_base0
	echo -en "\e]PE93a1a1" # S_base1
	echo -en "\e]P9cb4b16" # S_orange
	echo -en "\e]P7eee8d5" # S_base2
	echo -en "\e]P4268bd2" # S_blue
	echo -en "\e]P3b58900" # S_yellow
	echo -en "\e]PFfdf6e3" # S_base3
	echo -en "\e]PD6c71c4" # S_violet
	clear # against bg artifacts
fi
