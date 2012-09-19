" Begin Vundle setup
set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
" Remember to run `:BundleInstall` after adding bundles here! (`:BundleClean` to autoremove unused ones)
Bundle 'gmarik/vundle'
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
" TODO: Actually allow user to use a .vimbundles files to determine other bundles
filetype plugin indent on
" End Vundle setup

color tir_black
syntax on

set sw=4 ts=4 noet nu si hls
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

if has('gui_running')
	set guifont=Monaco\ for\ Powerline
    set transparency=0
end

" Easier tab navigation
map tl :tabnext<CR>
map th :tabprev<CR>
map tn :tabnew<CR>
map tq :tabclose<CR>

"" SvnDiff stuff
"noremap <F3> :call Svndiff("prev")<CR>
"noremap <F4> :call Svndiff("next")<CR>
"noremap <F5> :call Svndiff("clear")<CR>
"hi DiffAdd      ctermfg=0 ctermbg=2 guibg='green'
"hi DiffDelete   ctermfg=0 ctermbg=1 guibg='red'
"hi DiffChange   ctermfg=0 ctermbg=3 guibg='yellow'

" NERDCommenter toggle
map <C-c> <Leader>c<space>
"
" Ctrl-P: use Command-T to open, TODO open in new tab by default, allow esc
map <C-t> :CtrlP<CR>
"let g:CommandTAcceptSelectionMap = '<C-t>'
"let g:CommandTAcceptSelectionTabMap = '<CR>'
"let g:CommandTAcceptSelectionMap = '<CR>'
"let g:CommandTAcceptSelectionTabMap = '<C-t>'
"let g:CommandTCancelMap=['<ESC>','<C-c>']
"let g:CommandTNextMap=['<Down>']

" Open new tabs at the end of tabs
autocmd BufNew * if winnr('$') == 1 | tabmove99 | endif

let g:Powerline_symbols = 'fancy'

" Pardot: ignore a bunch of stuff
set wildignore+=apps/frontend/lib/moduleManagers/connector/webinar/libs/**
set wildignore+=lib/model/**/om/**
set wildignore+=lib/model/doctrine/**/generated/**

" Open json files as javascript for syntax highlighting
autocmd BufNewFile,BufRead *.json set ft=javascript

if bufwinnr(1)
	map <silent> <C-h> <C-w><
	map <silent> <C-j> <C-W>-
	map <silent> <C-k> <C-W>+
	map <silent> <C-l> <C-w>>
endif
