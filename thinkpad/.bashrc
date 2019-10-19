# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# Prompt customization
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

cyan="\e[1;36m"
green="\e[1;32m"
white="\e[1;37m"
reset="\e[m"
PS1="\[$cyan\]\u@\h:\w\[$green\]\$(parse_git_branch)\[$reset\]$ "

# Other environment variable initializations
export EDITOR="vim"
