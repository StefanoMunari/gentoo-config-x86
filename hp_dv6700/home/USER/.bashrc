# /etc/skel/.bashrc
# This file is sourced by all *interactive* bash shells on startup,
# including some apparently interactive shells such as scp and rcp
# that can't tolerate any output.  So make sure this doesn't display
# anything or bad things will happen !


# Test for an interactive shell.  There is no need to set anything
# past this point for scp and rcp, and it's important to refrain from
# outputting anything in those cases.
if [[ $- != *i* ]] ; then
	# Shell is non-interactive.  Be done now!
	return
fi
# \D{%I.%M.%S}
clr_purple='\e[1;35m';
clr_cyan='\e[1;36m';
clr_white='\e[1;37m';
clr_green='\e[1;32m';
clr_yellow='\e[1;33m';
clr_reset='\e[0m';
export PS1="\[$clr_purple\][$(power)]\[$clr_cyan\]\t\[$clr_yellow\]|\u@\h|\[$clr_white\]\w\[$clr_yellow\]|\$|\[$clr_reset\]";
# Aliases
alias la='ls -la'
alias lar='ls -laR'
alias h='history'
alias ports='netstat -tulpna'
alias psgrep='ps -aux | grep'
alias firefox='firefox --private-window'
