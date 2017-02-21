# Configure command prompt
# username@hostname:cwd $ [w/colors]
export PS1="\e[96m\u@\h:\e[0m\W \e[97m$\e[0m "
# Enable command line colors
export CLICOLOR=1
# Set colors for `ls` command
export LSCOLORS=ExFxBxDxCxegedabagacad
# Run ls with deets 
alias ls='ls -GFh'
