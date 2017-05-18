# Configure command prompt
# username@hostname:cwd $ [w/colors]
export PS1="\\[\e[96m\]\u@\h:\[\e[0m\]\W \[\e[97m\]$\[\e[0m\] "
# Enable command line colors
export CLICOLOR=1
# Set colors for `ls` command
export LSCOLORS=ExFxBxDxCxegedabagacad
# Run ls with deets
alias ls='ls -F'
alias lsa='ls -Fa'
alias imgdim='sips -g pixelHeight -g pixelWidth $1'

export CUDA_HOME=/usr/local/cuda
export DYLD_LIBRARY_PATH="$DYLD_LIBRARY_PATH:$CUDA_HOME/lib"
export PATH="$CUDA_HOME/bin:$PATH"

# Docker and TensorFlow Serving
export PATH="$PATH:$HOME/bin"

# thefuck
eval $(thefuck --alias)
eval $(thefuck --alias fuck)

# custom bash scripts should be in PATH
export PATH="$PATH:/Users/phaedrus/Development/bamm-bamm"

# vtop > top
alias top='vtop -t brew'

# snazzy standard for jslinting
alias sstandard='standard --verbose | snazzy'
alias standardf='standard --fix'

# cheery startup message
printf "\"I'm bored\" is a useless thing to say. You live in a great, big, vast world that you've seen none percent of. Even the inside of your own mind is endless; it goes on forever, inwardly, do you understand? The fact that you're alive is amazing, so you don't get to say \"I'm bored.\"\n\t--Louis C.K.\n\n"
