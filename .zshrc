autoload -U promptinit; promptinit
prompt pure

export NVM_LAZY_LOAD=true

plugins=(
  zsh-nvm
  git
  node
  fzf
  autojump 
  zsh-autosuggestions 
  zsh-syntax-highlighting
)

# Env first, cuz it loads OMZ
source $HOME/.env
source $HOME/.aliases
source $HOME/.cerego

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

# Functions
pullpasses() {
    if [ -n "$1" ]; then
        lpass show $(lpass ls | grep -i "$1" | awk '{ print $3 }' | sed 's/.$//')
    else
        echo "Error: missing search term"
    fi
}

pullpass() {
    if [ -n "$1" ]; then
        pullpasses "$1" | grep -i "Password:" | awk '{ print $2 }' | head -1 | pbcopy
    else
        echo "Error: missing search term"
    fi
}

# thefuck
eval $(thefuck --alias)

# Autojump
[[ -s /root/.autojump/etc/profile.d/autojump.sh ]] && source /root/.autojump/etc/profile.d/autojump.sh
autoload -U compinit && compinit -u

# fzf
# use ripgrep
if type rg &> /dev/null; then
    export FZF_DEFAULT_COMMAND='rg --files --hidden'
fi
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

timezsh() {
  shell=${1-$SHELL}
  for i in $(seq 1 10); do /usr/bin/time $shell -i -c exit; done
}
