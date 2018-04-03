" use vim instead of vi
set nocompatible
" Vundle setup
filetype off

" set runtime path to include Vundle, initialize
set rtp+=$HOME/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle
Plugin 'VundleVim/Vundle.vim'

" favorite plugins
" filetree manager
Plugin 'scrooloose/nerdtree'
" lean mean status/tabline
Plugin 'vim-airline/vim-airline'
" and some themes for above tabline
Plugin 'vim-airline/vim-airline-themes'
" markdown support
Plugin 'flazz/vim-colorschemes'
Plugin 'reedes/vim-colors-pencil'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'junegunn/goyo.vim'
Plugin 'junegunn/limelight.vim'
" Better parentheses
Plugin 'kien/rainbow_parentheses.vim'

" end Vundle handling
call vundle#end()
filetype plugin indent on

" turn on syntax highlighting
syntax enable
colorscheme ecostation

" vim-airline-themes setting
let g:airline_theme='simple'

set hidden

set wildmenu

set showcmd

" Search
""""""""""""""""""""""""""""""""""""""""
" search as characters are entered
set incsearch
" highlight search matches
set hlsearch
" hit spacebar to kill search highlights
nnoremap <space> :noh<return><esc>

set ignorecase

set smartcase

set backspace=indent,eol,start

" indent based on last line
set autoindent

set nostartofline

set laststatus=2

set confirm

set visualbell

set t_vb=

set cmdheight=2

set number

" enables ruler display, showing line num, column num, and relative position
set ruler

" number of spaces per tab
set tabstop=4

" delete the length of the tab rather than each individual space
set softtabstop=4

set shiftwidth=4

" turn tabs into spaces
set expandtab

set showmatch

" Navigation
""""""""""""""""""""""""""""""""""""""""""""""
" Move vertically by visual line (take THAT line wraps!)
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
" More natural split pane navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" And more natural splits (thanks thoughtbot)
set splitbelow
set splitright

" remove trailing whitespace
autocmd BufRead,BufWrite * if ! &bin | silent! %s/\s\+$//ge | endif
" Reload changes to .vimrc automatically
autocmd BufWritePost ~/.vimrc source ~/.vimrc
" Make text files prettier to look at and smoother to write in
autocmd FileType text setlocal wrap linebreak nolist
autocmd FileType markdown setlocal wrap linebreak nolist cursorline!
" Run Goyo for markdown files by default
" au BufReadPost,BufNewFile *.md Goyo
" disable markdown folding
let g:vim_markdown_folding_disabled = 1
" Limelight preferences
let g:limelight_paragraph_span = 2
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!
" Load rainbow parentheses by default
au VimEnter * RainbowParenthesesToggle
