export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(git)
source $ZSH/oh-my-zsh.sh

# aliases
alias v=nvim
alias light="kitty +kitten themes --reload-in=all Rosé Pine Dawn"
alias dark="kitty +kitten themes --reload-in=all Rosé Pine"
alias paths="echo $PATH | tr ':' '\n'"
alias p="ponder"
alias sz="source $HOME/.zshrc"
alias gs="git status"

# env
export EDITOR="nvim"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/phaedrus/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/phaedrus/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/phaedrus/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/phaedrus/google-cloud-sdk/completion.zsh.inc'; fi

eval "$(zoxide init zsh)"

source "$HOME/.asdf/asdf.sh"
