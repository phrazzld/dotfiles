set nocompatible                          " use vim instead of vi

" Vundle setup
"""""""""""""""""""""""""""""""""""""""""""
filetype off                              " required (vundle)
set rtp+=~/.vim/bundle/Vundle.vim         " include vundle in runtime path
call vundle#begin()                       " start vundle
Plugin 'VundleVim/Vundle.vim'             " let vundle manage vundle
" My favorite plugins
Plugin 'Vimjas/vim-python-pep8-indent'    " prettify python indentation
Plugin 'tpope/vim-fugitive'               " git tools
Plugin 'pangloss/vim-javascript'          " style js
call vundle#end()                         " end vundle handling
filetype plugin indent on                 " required (vundle)


" Appearance
"""""""""""""""""""""""""""""""""""""""""""
syntax enable                             " turn on syntax highlighting
set list listchars=tab:▷⋅,trail:⋅,nbsp:⋅  " show invisible characters
set autoindent                            " indent based on last line
set smartindent                           " indent after colons and the like
set tabstop=4                             " num. visual spaces per tab
set softtabstop=4                         " num. spaces in tab (editing)
set expandtab                             " turn tabs into spaces
set shiftwidth=4                          " num. spaces for auto-indent
set ruler                                 " show line and col nums in status
set number                                " show line numbers inline
set showcmd                               " show command in status bar
set cursorline                            " highlight the current line
set showmatch                             " highlight matching [{()}]


" Navigation
"""""""""""""""""""""""""""""""""""""""""""
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


" Search
"""""""""""""""""""""""""""""""""""""""""""
set incsearch                             " search as chars are entered
set hlsearch                              " highlight search matches
" hit spacebar to kill search highlights
nnoremap <space> :noh<return><esc>


" Functions
"""""""""""""""""""""""""""""""""""""""""""
" Remove any trailing whitespace in the file
autocmd BufRead,BufWrite * if ! &bin | silent! %s/\s\+$//ge | endif
" Reload changes to .vimrc automatically
autocmd BufWritePost  ~/.vimrc source ~/.vimrc
" Make text files prettier to look and and smoother to write in
autocmd FileType text setlocal wrap linebreak nolist cursorline!
