autoload -U promptinit; promptinit
prompt pure

plugins=(
  git
  node
  fzf
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
. /usr/local/opt/asdf/libexec/asdf.sh

source /Users/phaedrus/.docker/init-zsh.sh || true # Added by Docker Desktop

getquote
