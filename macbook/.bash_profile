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

# vtop > top
alias top='vtop -t brew'

# snazzy standard for jslinting
alias sstandard='standard --verbose | snazzy'
alias standardf='standard --fix'

# add GOPATH to PATH
export GOPATH=`go env GOPATH`
export PATH="$PATH:$GOPATH/bin"
# Add inphra to PATH
export PATH="$PATH:/Users/phaedrus/Dev/inphra"
alias inphra='node inphra'

# cheery startup message
#printf "\n\"I'm bored\" is a useless thing to say. You live in a great, big, vast world that you've seen none percent of. Even the inside of your own mind is endless; it goes on forever, inwardly, do you understand? The fact that you're alive is amazing, so you don't get to say \"I'm bored.\"\n\t--Louis C.K.\n\n"

alias v='vim'
alias l='ls -alh'
alias agent='eval "$(ssh-agent -s)"; ssh-add -K ~/.ssh/id_rsa'
alias do='v $HOME/tasks.md'
alias vlc='/Applications/VLC.app/Contents/MacOS/VLC'
alias pluck='/Users/phaedrus/Dev/bamm-bamm/pluck'
export ALEXANDRIA='/Volumes/Alexandria'
export ALEXANDRIA_TV='/Volumes/Alexandria/channel_sixty_two/tv'
export ATLANTIS='/Volumes/Atlantis'

# startup message
pluck /Users/phaedrus/Documents/startup_messages.md

# Load rbenv automatically
eval "$(rbenv init -)"

# Android Studio configuration for React Native
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

# Setting PATH for Python 2.7
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
export PATH
# added by Anaconda3 2019.07 installer
# >>> conda init >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$(CONDA_REPORT_ERRORS=false '/anaconda3/bin/conda' shell.bash hook 2> /dev/null)"
if [ $? -eq 0 ]; then
    \eval "$__conda_setup"
else
    if [ -f "/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/anaconda3/etc/profile.d/conda.sh"
        CONDA_CHANGEPS1=false conda activate base
    else
        \export PATH="/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda init <<<

# History is now
shopt -s histappend
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"
