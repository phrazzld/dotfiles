# Configure command prompt
blue="\033[0;34m"
green="\033[0;32m"

ps1_blue='\['"$blue"'\]'
ps1_green='\['"$green"'\]'

parse_git_branch() {
  gitstatus=`git status 2> /dev/null`
  if [[ `echo $gitstatus | grep "Changes to be committed"` != "" ]]
  then
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1***)/'
  elif [[ `echo $gitstatus | grep "Changes not staged for commit"` != "" ]]
  then
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1**)/'
  elif [[ `echo $gitstatus | grep "Untracked"` != "" ]]
  then
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1*)/'
  elif [[ `echo $gitstatus | grep "nothing to commit"` != "" ]]
  then
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
  else
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1?)/'
  fi
}

parse_git_branch_color() {
  br=$(parse_git_branch)
  if [[ $br == "(master)" || $br == "(master*)" || $br == "(master**)" || $br == "(master***)" ]]; then
    echo -e "${blue}"
  else
    echo -e "${green}"
  fi
}

# username@hostname:cwd $ [w/colors]
#
export PS1="\\[\e[96m\]\u@\h:\[\e[0m\]\W \[\$(parse_git_branch_color)\]\$(parse_git_branch)$ps1_blue \[\e[97m\]$\[\e[0m\] "
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

# add GOPATH to PATH
export GOPATH=`go env GOPATH`
export PATH="$PATH:$GOPATH/bin"

# cheery startup message
printf "\n\"I'm bored\" is a useless thing to say. You live in a great, big, vast world that you've seen none percent of. Even the inside of your own mind is endless; it goes on forever, inwardly, do you understand? The fact that you're alive is amazing, so you don't get to say \"I'm bored.\"\n\t--Louis C.K.\n\n"
