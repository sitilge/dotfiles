#
# ~/.bash_profile
#

# source the .bashrc
[[ -f ~/.bashrc ]] && . ~/.bashrc

# start the ssh-agent
if ! pgrep -u "$USER" ssh-agent > /dev/null; then
	ssh-agent > ~/.ssh-agent
fi
if [[ "$SSH_AGENT_PID" == "" ]]; then
	eval "$(<~/.ssh-agent)"
fi

# if empty keylist, add keys permanently
if ! ssh-add -l > /dev/null; then
	ssh-add -k
fi

# start the xorg
exec startx
