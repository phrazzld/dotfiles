" Set up Plugins
call plug#begin(stdpath('data') . '/plugged')
Plug 'fatih/vim-go', { 'do' : ':GoUpdateBinaries' }
Plug 'sheerun/vim-polyglot'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'luochen1990/rainbow'
Plug 'rainglow/vim'
Plug 'Shougo/denite.nvim', { 'do' : ':UpdateRemotePlugins' }
Plug 'neoclide/coc.nvim', { 'branch' : 'release' }
Plug 'jiangmiao/auto-pairs'
Plug 'prettier/vim-prettier', {
    \ 'do': 'npm install',
    \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }
Plug 'tpope/vim-surround'
call plug#end()

"" Appearance
set termguicolors
set background=dark
syntax enable
set number
set cursorline
set linespace=3
set guifont=Fira\ Code:h12
highlight CursorLine cterm=None ctermbg=234 ctermfg=None
set autoindent
set smartindent
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set showmatch
set backspace=indent,eol,start
set visualbell

" Favorite colorschemes
"colorscheme pleasure
"colorscheme frantic
"colorscheme monzo
colorscheme glance
"colorscheme waste
"colorscheme vegetable
"colorscheme userscape
"colorscheme tron
"colorscheme tribal
"colorscheme tonic
"colorscheme tetra
"colorscheme super
"colorscheme storm
"colorscheme stark
"colorscheme snappy
"colorscheme scorch
"colorscheme rainbow
"colorscheme rebellion
"colorscheme penitent
"colorscheme piggy
"colorscheme otakon
let hour = strftime("%H")
if hour < 7 || hour >= 18
    colorscheme frantic
endif

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
" Tab between buffers
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>

set incsearch
set hlsearch
" hit spacebar to kill search highlights
nnoremap <space> :noh<return><esc>

try
" Denite setup
call denite#custom#var('file/rec', 'command', ['rg', '--files', '--glob', '!.git'])
call denite#custom#var('grep', 'command', ['rg'])
call denite#custom#var('grep', 'default_opts', ['--hidden', '--vimgrep', '--heading', '-S'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', ['--regexp'])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])
call denite#custom#var('buffer', 'date_format', '')
call denite#custom#map('insert,normal', "<C-t>", '<denite:do_action:tabopen>')
call denite#custom#map('insert,normal', "<C-v>", '<denite:do_action:vsplit>')
call denite#custom#map('insert,normal', "<C-h>", '<denite:do_action:split>')

let s:denite_options = {'default' : {
\ 'split': 'floating',
\ 'start_filter': 1,
\ 'auto_resize': 1,
\ 'source_names': 'short',
\ 'prompt': '>:',
\ 'statusline': 0,
\ 'highlight_matched_char': 'WildMenu',
\ 'highlight_matched_range': 'Visual',
\ 'highlight_window_background': 'Visual',
\ 'highlight_filter_background': 'StatusLine',
\ 'highlight_prompt': 'StatusLine',
\ 'winrow': 1,
\ 'vertical_preview': 1
\ }}

" Loop through denite options and enable them
function! s:profile(opts) abort
    for l:fname in keys(a:opts)
        for l:dopt in keys(a:opts[l:fname])
            call denite#custom#option(l:fname, l:dopt, a:opts[l:fname][l:dopt])
        endfor
    endfor
endfunction

call s:profile(s:denite_options)
catch
    echo 'Denite not installed. It should work after running :PlugInstall'
endtry

" Denite shortcuts
nmap ; :Denite buffer<CR>
nmap <leader>t :DeniteProjectDir file/rec<CR>
nnoremap <leader>g :<C-u>Denite grep:. -no-empty<CR>
nnoremap <leader>j :<C-u>DeniteCursorWord grep:.<CR>

" Denite mappings in filter mode
"   <C-o>           - Switch to normal mode inside search
"   <Esc>           - Exit denite window in any mode
"   <CR>            - Open currently selected file in any mode
autocmd FileType denite-filter call s:denite_filter_my_settings()
function! s:denite_filter_my_settings() abort
    imap <silent><buffer> <C-o>
    \ <Plug>(denite_filter_quit)
    inoremap <silent><buffer><expr> <Esc>
    \ denite#do_map('quit')
    nnoremap <silent><buffer><expr> <Esc>
    \ denite#do_map('quit')
    inoremap <silent><buffer><expr> <CR>
    \ denite#do_map('do_action')
endfunction

" Define mappings while in denite window
"   <CR>            - Opens currently selected file
"   q or <Esc>      - Quit Denite window
"   d               - Delete currently selected file
"   p               - Preview currently selected file
"   <C-o> or i      - Switch to insert mode inside of filter prompt
autocmd FileType denite call s:denite_my_settings()
function! s:denite_my_settings() abort
    nnoremap <silent><buffer><expr> <CR>
    \ denite#do_map('do_action')
    nnoremap <silent><buffer><expr> q
    \ denite#do_map('quit')
    nnoremap <silent><buffer><expr> <Esc>
    \ denite#do_map('quit')
    nnoremap <silent><buffer><expr> d
    \ denite#do_map('do_action', 'delete')
    nnoremap <silent><buffer><expr> p
    \ denite#do_map('do_action', 'preview')
    nnoremap <silent><buffer><expr> i
    \ denite#do_map('open_filter_buffer')
    nnoremap <silent><buffer><expr> <C-o>
    \ denite#do_map('open_filter_buffer')
endfunction

" coc.nvim config
" if hidden is not set, TextEdit might fail
set hidden
" better display for messages
set cmdheight=2
" default 4000 is a bad time (for diagnostic messages)
set updatetime=300
" don't give |ins-completion-menu| messages
set shortmess+=c
" always show signcolumns
set signcolumn=yes
" use tab for trigger completion with characters ahead and nav
" use cmd ':verbose imap <tab>' to ensure it's not already mapped
inoremap <silent><expr> <TAB>
    \ pumvisible() ? "\<C-n>" :
    \ <SID>check_back_space() ? "<TAB>" :
    \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1] =~# '\s'
endfunction

" use <c-space> to trigger completion
inoremap <silent><expr> <c-space> coc#refresh()

" Functions
" Remove any trailing whitespace in the file
autocmd BufRead,BufWrite * if ! &bin | silent! %s/\s\+$//ge | endif
" Reload changes to .vimrc automatically
autocmd BufWritePost  ~/.config/nvim/init.vim source ~/.config/nvim/init.vim
" Make text files prettier to look and and smoother to write in
autocmd FileType text setlocal wrap linebreak nolist cursorline!
autocmd FileType markdown setlocal wrap linebreak nolist cursorline!
" JavaScript wants different indents
autocmd FileType javascript setlocal tabstop=2 shiftwidth=2 softtabstop=2
" Limelight configs
let g:limelight_paragraph_span = 2
let g:limelight_conceal_ctermfg = 240
let g:limelight_conceal_guifg = '#000000'
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!
" Highlight React properly
autocmd BufEnter *.js set ft=javascript
" Automatically import Golang modules on save
let g:go_fmt_command = "goimports"
" Run prettier before saving
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html Prettier

" Different filetypes deserve different colorschemes
autocmd BufEnter *.md colorscheme frantic
autocmd BufEnter *.js colorscheme glance
autocmd BufEnter *.go colorscheme desert
