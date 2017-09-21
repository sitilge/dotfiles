#
# ~/.bash_profile
#

# start the ssh-agent
if ! pgrep -u "$USER" ssh-agent > /dev/null; then
	ssh-agent > ~/.ssh-agent-thing
fi
if [[ "$SSH_AGENT_PID" == "" ]]; then
	eval "$(<~/.ssh-agent-thing)"
fi

# if empty keylist, add keys permanently
if ! ssh-add -l > /dev/null; then
	ssh-add -k
fi

# source the .bashrc
[[ -f ~/.bashrc ]] && . ~/.bashrc
