# oh-my-zsh
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(git)
source $ZSH/oh-my-zsh.sh

source $HOME/.env
source $HOME/.aliases
source $HOME/.fun

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/phaedrus/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/phaedrus/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/phaedrus/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/phaedrus/google-cloud-sdk/completion.zsh.inc'; fi

eval "$(zoxide init zsh)"

source "$HOME/.asdf/asdf.sh"

$HOME/development/display_random_quote.py

export PATH="/opt/homebrew/opt/ruby@3.1/bin:$PATH"
export PATH="/opt/homebrew/lib/ruby/gems/3.1.0/bin:$PATH"

. "$HOME/.asdf/asdf.sh"
