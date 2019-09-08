set nocompatible                          " use vim instead of vi

" Vundle setup
"""""""""""""""""""""""""""""""""""""""""""
filetype off                              " required for vundle
set rtp+=~/.vim/bundle/Vundle.vim         " include vundle in runtime path
call vundle#begin()                       " start vundle
Plugin 'VundleVim/Vundle.vim'             " let vundle manage vundle
" My favorite plugins
Plugin 'Vimjas/vim-python-pep8-indent'    " prettify python indentation
Plugin 'tpope/vim-fugitive'               " git tools
Plugin 'pangloss/vim-javascript'          " style js
Plugin 'mxw/vim-jsx'                      " react friendly
Plugin 'maxmellon/vim-jsx-pretty'         " even more react friendly
Plugin 'morhetz/gruvbox'                  " culluhh
Plugin 'luochen1990/rainbow'              " better parentheses
Plugin 'fatih/vim-go'                     " golang ide
Plugin 'godlygeek/tabular'                " required for vim-markdown
Plugin 'plasticboy/vim-markdown'          " better markdown support
Plugin 'junegunn/goyo.vim'                " for rubberducking
Plugin 'junegunn/limelight.vim'           " for rubberducking
Plugin 'flazz/vim-colorschemes'           " more colorschemes
Plugin 'rafi/awesome-vim-colorschemes'    " even more colorschemes
Plugin 'nikvdp/ejs-syntax'                " highlighting for EJS
Plugin 'vim-ruby/vim-ruby'                " ruby syntax highlighting
Plugin 'ycm-core/YouCompleteMe'           " tabnine dependency
Plugin 'zxqfl/tabnine-vim'                " code autocompletion
call vundle#end()                         " end vundle handling
filetype plugin indent on                 " required for vundle


" Appearance
"""""""""""""""""""""""""""""""""""""""""""
syntax enable                             " turn on syntax highlighting
set autoindent                            " indent based on last line
set smartindent                           " indent after colons and the like
set tabstop=2                             " num. visual spaces per tab
set softtabstop=2                         " num. spaces in tab while editing
set expandtab                             " turn tabs into spaces
set shiftwidth=2                          " num. spaces for auto-indent
set ruler                                 " show line and col nums in status
set number                                " show line numbers inline
set showcmd                               " show command in status bar
set showmatch                             " highlight matching [{()}]
set backspace=indent,eol,start            " backspace in insert mode
let g:jsx_ext_required = 0                " jsx highlighting for js files
let g:rainbow_active = 1
set visualbell
" Change background based on time of day
let hour = strftime("%H")
if 7 <= hour && hour < 19
  colorscheme PaperColor
  set background=light
else
  colorscheme Tomorrow-Night-Eighties
  set background=dark
endif
" More colorschemes
" PaperColor
" CandyPaper
" dracula
" seoul256
" solarized8
" molokai
" Tomorrow-Night-Blue
" Tomorrow-Night-Eighties

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
" more natural split-pane navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-H> <C-W><C-H>
nnoremap <C-L> <C-W><C-L>
" and more natural splits
set splitbelow
set splitright

" Show syntax highlighting groups for word under cursor
nmap <C-S-P> :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc


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
autocmd FileType markdown setlocal wrap linebreak nolist cursorline!
" Better jots
let g:vim_markdown_folding_disabled = 1
" Limelight configs
let g:limelight_paragraph_span = 2
let g:limelight_conceal_ctermfg = 240
let g:limelight_conceal_guifg = '#000000'
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!
" Change colorscheme based on filetype
autocmd BufEnter *.md colorscheme PaperColor
" Highlight React properly
autocmd BufEnter *.js set ft=javascript
" Use DeepTabNine autocompleter
set rtp+=~/tabnine-vim
" Automatically import Golang modules on save
let g:go_fmt_command = "goimports"
