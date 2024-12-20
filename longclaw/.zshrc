plugins=(
  asdf
  zsh-autosuggestions
  zsh-syntax-highlighting
)

# Env first, cuz it loads OMZ
source $HOME/.env
source $HOME/.fun
source $HOME/.aliases
source $HOME/.memre
source $HOME/.secrets

# History
HISTFILE=~/.zsh_history
HISTSIZE=1024
SAVEHIST=1024
setopt append_history
setopt hist_ignore_all_dups
unsetopt hist_ignore_space
setopt hist_reduce_blanks
setopt hist_verify
setopt inc_append_history
setopt share_history
setopt bang_hist

# thefuck
if command -v thefuck >/dev/null 2>&1; then
  fuck() {
    eval "$(thefuck --alias)" && fuck
  }
fi

# Zoxide
eval "$(zoxide init zsh)"

# fzf
# use ripgrep
if type rg &> /dev/null; then
    export FZF_DEFAULT_COMMAND='rg --files --hidden'
fi
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# asdf
source "$HOME/.asdf/asdf.sh"

source /Users/phaedrus/.docker/init-zsh.sh || true # Added by Docker Desktop

# random_quote
$HOME/development/sqlite_random_quote.py

# tabtab source for electron-forge package
# uninstall by removing these lines or running `tabtab uninstall electron-forge`
[[ -f /Users/phaedrus/.asdf/installs/nodejs/17.9.1/lib/node_modules/electron-forge/node_modules/tabtab/.completions/electron-forge.zsh ]] && . /Users/phaedrus/.asdf/installs/nodejs/17.9.1/lib/node_modules/electron-forge/node_modules/tabtab/.completions/electron-forge.zsh
# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/phaedrus/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/phaedrus/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/phaedrus/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/phaedrus/google-cloud-sdk/completion.zsh.inc'; fi

eval "$(starship init zsh)"
