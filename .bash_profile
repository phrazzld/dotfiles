# Configure command prompt
# username@hostname:cwd $ [w/colors]
export PS1="\\[\e[96m\]\u@\h:\[\e[0m\]\W \[\e[97m\]$\[\e[0m\] "
# Enable command line colors
export CLICOLOR=1
# Set colors for `ls` command
export LSCOLORS=ExFxBxDxCxegedabagacad
# Run ls with deets
alias ls='ls -GFh'
alias imgdim='sips -g pixelHeight -g pixelWidth $1'

export CUDA_HOME=/usr/local/cuda
export DYLD_LIBRARY_PATH="$DYLD_LIBRARY_PATH:$CUDA_HOME/lib"
export PATH="$CUDA_HOME/bin:$PATH"

# added by Anaconda3 4.3.1 installer
export PATH="/Users/phaedrus/anaconda3/bin:$PATH"

# MySQL
export PATH="/usr/local/mysql/bin:$PATH"

# Android
export ANDROID_HOME="$HOME/Library/Android/sdk"
export PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools

# Docker and TensorFlow Serving
export PATH="$PATH:$HOME/bin"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/phaedrus/Development/google-cloud-sdk/path.bash.inc' ]; then source '/Users/phaedrus/Development/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/phaedrus/Development/google-cloud-sdk/completion.bash.inc' ]; then source '/Users/phaedrus/Development/google-cloud-sdk/completion.bash.inc'; fi

# thefuck
eval $(thefuck --alias)
eval $(thefuck --alias fuck)

# custom shellscripts should be in PATH
export PATH="$PATH:/Users/phaedrus/Development/shellscripts"
