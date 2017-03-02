alias ls='ls -GFh --color=always'
alias ll='ls -al'
alias la='ls -A'

alias dir='dir --color=always'
alias vidr='dir --color=always'

alias grep='grep --color=always'
alias fgrep='fgrep --color=always'
alias egrep='egrep --color=always'

alias lxterminal='lxterminal --geometry=80x42'

DATE=`date +"%Y%m%d"`
alias journal="vi ~/Documents/pile/$DATE.txt"

# scripts
alias update_dotfiles='~/scripts/update_dotfiles'
alias scrub_history='cat ~/../../dev/null > ~/.bash_history && history -c'
