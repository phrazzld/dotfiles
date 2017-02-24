" Always use Vim instead of Vi
set nocompatible

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vundle setup
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype off
" Set runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" Let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" Add your plugins here
" Python PEP8 indentation rules
Plugin 'Vimjas/vim-python-pep8-indent'

" All your plugins must be added before this line:
call vundle#end()
" Required for Vundle
filetype plugin indent on

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Non-Plugin stuff
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn syntax highlighting on
syntax enable

" Show invisible characters
set list listchars=tab:▷⋅,trail:⋅,nbsp:⋅

" Indent next line based on last line
set autoindent

" Indent after colons and the like
set smartindent

" Number of visual spaces per tab
set tabstop=4

" Number of spaces in tab when editing
set softtabstop=4

" Turn tabs into spaces
set expandtab

" Number of spaces to user for auto-indent
set shiftwidth=4

" Turn on line and col numbers
set ruler

" Show command in bottom bar
set showcmd

" Underline the current line
set cursorline

" Highlight matching [{()}]
set showmatch

" Search as characters are entered
set incsearch

" Highlight search matches
set hlsearch

" Turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>

" Move vertically by visual line (take that line wraps!)
nnoremap j gj
nnoremap k gk

" Watch for changes to .vimrc and automatically reload config when necessary
augroup myvimrc
    au!
    au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
augroup END
