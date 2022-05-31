# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
#if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
#fi
#
#source /usr/local/opt/powerlevel10k/powerlevel10k.zsh-theme

# TEST

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

#ZSH_THEME="agnoster"

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
#eval $(thefuck --alias)

# Autojump
[[ -s /root/.autojump/etc/profile.d/autojump.sh ]] && source /root/.autojump/etc/profile.d/autojump.sh
autoload -U compinit && compinit -u

# fzf
#determines search program for fzf
#if type ag &> /dev/null; then
#    export FZF_DEFAULT_COMMAND='ag -p ~/.gitignore -g ""'
#fi
# prefer rg over ag
if type rg &> /dev/null; then
    export FZF_DEFAULT_COMMAND='rg --files --hidden'
fi
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# # Function to see last 2 dirs
# function PWD {
#     pwd | awk -F\/ '{print $(NF-1),$(NF)}' | sed "s/ /\\//" | tr -d '\n'
# }
#
# # Function to check if AWS MFA credentials are exported
# function CHKMFA {
#     if [ -n "$AWS_SESSION_TOKEN" ]; then
#         printf '\xE2\x9C\x94'
#     else
#         printf '-'
#     fi
# }
#
# sourcing cli switcher
# . $HOME/.switcher

# Startup script
# printf "\n"
# shuf -n 1 $HOME/.quotes
# Use starship prompt
#eval "$(starship init zsh)"

# tabtab source for packages
# uninstall by removing these lines
#[[ -f ~/.config/tabtab/__tabtab.zsh ]] && . ~/.config/tabtab/__tabtab.zsh || true

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
#[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

timezsh() {
  shell=${1-$SHELL}
  for i in $(seq 1 10); do /usr/bin/time $shell -i -c exit; done
}
