" Begin Vundle setup
set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
" Remember to run `:BundleInstall` after adding bundles here! (`:BundleClean` to autoremove unused ones)
Bundle 'gmarik/vundle'
"Bundle 'altercation/vim-colors-solarized'
Bundle 'vim-scripts/tir_black'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-fugitive'
Bundle 'Lokaltog/vim-powerline'
Bundle 'kien/ctrlp.vim'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'scrooloose/nerdcommenter'
Bundle 'kchmck/vim-coffee-script'
Bundle 'msanders/snipmate.vim'
Bundle 'anthonymarion/coffeScript-VIM-Snippets'
Bundle 'digitaltoad/vim-jade'
Bundle 'vim-scripts/Rename'
Bundle 'groenewege/vim-less'
Bundle 'freitass/todo.txt-vim'
Bundle 'peterhoeg/vim-tmux.git'
Bundle 'kien/ctrlp.vim'
Bundle "pangloss/vim-javascript"
Bundle 'majutsushi/tagbar'
Bundle 'mattn/webapi-vim'
"Bundle 'SirVer/ultisnips'
Bundle 'Townk/vim-autoclose.git'
Bundle 'scrooloose/nerdtree'
Bundle 'jistr/vim-nerdtree-tabs'
" TODO: Actually allow user to use a .vimbundles files to determine other bundles
filetype plugin indent on
" End Vundle setup

syntax enable
"set background=dark
colorscheme tir_black

set shiftwidth=4 
set tabstop=4 
set noexpandtab
set number 
set si
set hlsearch
set backup
set writebackup
set backupdir=~/.vimbackup
set dir=~/.vimswap
set noswapfile
set nowrap
set mouse=a
set nocursorline
set nolist
set nospell
set encoding=utf8
set laststatus=2
set ttyfast
set modeline

if has('gui_running')
	set guifont=Monaco\ for\ Powerline
    set transparency=0
end

" Easier tab navigation
map tl :tabnext<CR>
map th :tabprev<CR>
map tn :tabnew<CR>
map tq :tabclose<CR>

" NERDCommenter toggle
map <C-c> <Leader>c<space>
"
" Ctrl-P: use Ctrl-T to open
map <C-t> :CtrlP<CR>

map <Leader>t :NERDTreeFind<CR>

" Open new tabs at the end of tabs
autocmd BufNew * if winnr('$') == 1 | tabmove99 | endif

let g:Powerline_symbols = 'fancy'

" Pardot: ignore a bunch of stuff
set wildignore+=apps/frontend/lib/moduleManagers/connector/webinar/libs/**
set wildignore+=lib/model/**/om/**
set wildignore+=lib/model/doctrine/**/generated/**

" Open json files as javascript for syntax highlighting
autocmd BufNewFile,BufRead *.json set ft=javascript

" Open mjs (moustache-js template) as html
autocmd BufNewFile,BufRead *.mjs set ft=html

au BufRead,BufNewFile *.md set filetype=markdown

if bufwinnr(1)
	map <silent> <C-h> <C-w><
	map <silent> <C-j> <C-W>-
	map <silent> <C-k> <C-W>+
	map <silent> <C-l> <C-w>>
endif

" Open ctrl-p file in new tab
let g:ctrlp_prompt_mappings = {
  \ 'AcceptSelection("e")': [],
  \ 'AcceptSelection("t")': ['<cr>', '<c-m>'],
  \ }

let g:ctrlp_custom_ignore = 'node_modules\|.git'

let g:ctrlp_user_command = {
	\ 'types': {
		\ 1: ['.git', 'cd %s && git ls-files'],
		\ 2: ['.hg', 'hg --cwd %s locate -I .'],
		\ },
	\ 'fallback': 'find %s -type f'
	\ }
