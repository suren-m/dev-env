
" needed for rust.vim
syntax enable
filetype plugin indent on

" use spaces
set tabstop=4 shiftwidth=4 expandtab
set encoding=utf-8

set relativenumber

" don't split up
set splitbelow splitright 

"set colorcolumn=80

" ------------------------ "
" vimplug
" :PlugInstall :PlugUpgrade
" ------------------------ "
call plug#begin('~/.vim/plugged')

Plug 'rust-lang/rust.vim'
Plug 'scrooloose/syntastic'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'jremmen/vim-ripgrep'

" impact on startup time. use only when needed
" Plug 'preservim/tagbar'

" requires nodejs 
":CocInstall coc-rust-analyzer
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

"--------------------------"
"start rip-grep from root of a project"
if executable('rg')
    let g:rg_derive_root='true'
endif


"----------------------------"
" Rust
"----------------------------"
let g:rustfmt_autosave = 1

" recommended settings for syntastic

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" ------------------------- "
" Shortcuts
" ------------------------- "
set pastetoggle=<f2>

" ctrl + s for save
:nmap <c-s> :w<CR>
:imap <c-s> <Esc>:w<CR>a

"  switch panes with just ctrl + direction keys
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" fzf shortcut - exclude files in gitignore
map <s-f> <Esc><ESc>:GFiles!<CR>

" tag bar
nmap <F7> :TagbarToggle<CR>

" Syntastic
nmap <F3> :Errors<CR>
"or SyntasticReset
nmap <F4> :lclose<CR> 

" Coc goto def. <C-O> to go back to previous file
nmap <silent> gd <Plug>(coc-definition)

