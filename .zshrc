# Detect the current host
HOSTNAME="$(hostname)"

# Core plugin definitions (zoboomafoo style)
plugins=(
  asdf
  zsh-autosuggestions
  zsh-syntax-highlighting
)

# Source environment, functions, and aliases
source $HOME/.env
source $HOME/.fun
source $HOME/.aliases

# Environment-specific source files
case "$HOSTNAME" in
  *"zoboomafoo"*)
    # Work-specific configuration files
    source $HOME/.memre
    source $HOME/.secrets
    ;;
  "serenity")
    # Personal-specific configuration
    # Display random quote on startup
    random_quote
    
    # Fallback to Oh-My-Zsh if starship is not available
    if ! command -v starship &> /dev/null; then
      export ZSH="$HOME/.oh-my-zsh"
      ZSH_THEME="robbyrussell"
      source $ZSH/oh-my-zsh.sh
    fi
    ;;
esac

# History settings
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

# thefuck alias if available
if command -v thefuck >/dev/null 2>&1; then
  fuck() {
    eval "$(thefuck --alias)" && fuck
  }
fi

# Zoxide (directory jumper)
if command -v zoxide &> /dev/null; then
  eval "$(zoxide init zsh)"
fi

# ASDF version manager
if [ -f "$HOME/.asdf/asdf.sh" ]; then
  source "$HOME/.asdf/asdf.sh"
fi

# Docker Desktop if available
[ -f $HOME/.docker/init-zsh.sh ] && source $HOME/.docker/init-zsh.sh || true

# FZF integration
# Use ripgrep if available
if type rg &> /dev/null; then
  export FZF_DEFAULT_COMMAND='rg --files --hidden'
fi
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Add yarn bin to PATH if needed
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# Google Cloud SDK (if available)
if [ -f "$HOME/google-cloud-sdk/path.zsh.inc" ]; then 
  source "$HOME/google-cloud-sdk/path.zsh.inc"
fi

# Google Cloud SDK completions (if available)
if [ -f "$HOME/google-cloud-sdk/completion.zsh.inc" ]; then 
  source "$HOME/google-cloud-sdk/completion.zsh.inc"
fi

# Electron-forge tab completion
[[ -f $HOME/.asdf/installs/nodejs/17.9.1/lib/node_modules/electron-forge/node_modules/tabtab/.completions/electron-forge.zsh ]] && . $HOME/.asdf/installs/nodejs/17.9.1/lib/node_modules/electron-forge/node_modules/tabtab/.completions/electron-forge.zsh

# Initialize starship prompt
if command -v starship &> /dev/null; then
  eval "$(starship init zsh)"
fi