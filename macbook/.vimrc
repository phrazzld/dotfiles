set nocompatible                          " use vim instead of vi
set laststatus=2			              " turn statusline on
set showmatch				              " highlight matching [{()}]
set ruler				                  " show line and col nums in status
set number                                " show line numbers inline
set showcmd				                  " show command in status bar
set expandtab				              " turn tabs into spaces
set tabstop=4				              " 4 visual space per tab
set softtabstop=4			              " 4 spaces in tab while editing
set shiftwidth=4			              " 4 spaces for auto-indent
set incsearch                             " search as chars are entered
set hlsearch                              " highlight search matches
nnoremap <space> :noh<return><esc>        " hit spacebar to kill search highlights

colorscheme corporation-modified	      " white text / slate bg
" colorscheme shine			              " black text / white bg
" colorscheme murphy			          " green text / black bg
" colorscheme elflord			          " white text / black bg

"" Functions ""
" Remove any trailing whitespace in the file
autocmd BufRead,BufWrite * if ! &bin | silent! %s/\s\+$//ge | endif
" Reload changes to .vimrc automatically
autocmd BufWritePost  ~/.vimrc source ~/.vimrc
" Make text files prettier to look at and smoother to write in
autocmd FileType text setlocal wrap linebreak nolist cursorline!
autocmd FileType markdown setlocal wrap linebreak nolist cursorline!

"" Move vertically by visual line (take THAT line wraps!)
nnoremap j gj
nnoremap k gk
" Hey! You! No arrow keys!
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
" more natural split-pane navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-H> <C-W><C-H>
nnoremap <C-L> <C-W><C-L>
" and more natural splits
set splitbelow
set splitright
