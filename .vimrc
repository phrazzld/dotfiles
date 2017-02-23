" Always use Vim instead of Vi
set nocompatible

" Turn syntax highlighting on
syntax enable

" Indent next line based on last line
set autoindent

" Indent based on filetype
filetype plugin indent on

" Expand scope of html indentation
:let g:html_indent_inctags = "html,body,head,tbody"

" Number of visual spaces per tab
set tabstop=4

" Number of spaces in tab when editing
set softtabstop=4

" Turn tabs into spaces
set expandtab

" Turn on line numbers
set number

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

" Configure language-specific settings for certain filetypes
augroup configgroup
	autocmd!
	autocmd VimEnter * highlight clear SignColumn
	autocmd FileType python setlocal commentstring=#\ %s
	autocmd BufEnter *.sh setlocal tabstop=2
	autocmd BufEnter *.sh setlocal shiftwidth=2
	autocmd BufEnter *.sh setlocal softtabstop=2
augroup END

" Enable backup support
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/vmp,/tmp
set writebackup
