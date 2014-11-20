" .vimrc file by Diogo Neves
" One day it may be awesome,
" today is not that day


" Clear previous state and commands that have side-effects
set nocompatible
" Key leader
let mapleader=","


" vimrc editing
" Open .vimrc using ,ev
nmap <silent> <leader>ev :e $MYVIMRC<CR>
autocmd! bufwritepost .vimrc source %


" Vim plugin loader
call pathogen#helptags()
call pathogen#infect()
filetype off
"filetype plugin on
set modeline


" Copy & Paste
set pastetoggle=<F2>
set clipboard=unnamed


" Key mapping
" No need to press shift anymore
nnoremap ; :
set bs=2
" Window Navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
" Tab navigation
map <leader>n <esc>:tabprevious<CR>
map <leader>m <esc>:tabnext<CR>
map <leader>tn <esc>:tabnew<CR>
" Undo
noremap <C-z> :undo<CR>
vnoremap <C-z> :undo<CR>
inoremap <C-z> :undo<CR>
" Ident without losing selection
vnoremap < <gv
vnoremap > >gv


" Mouse
" Press ALT to use the mouse
set mouse=a


" Vim commands
" Force override with :w!!
cmap w!! w !sudo tee % >/dev/null


" Load colour scheme
if &t_Co >= 256 || has("gui_running")
    colorscheme mustang
endif
if &t_Co > 2 || has("gui_running")
    " switch syntax highlighting on, when the terminal has colors
    syntax on
endif
highlight ColorColumn ctermbg=233


" Code completion and identation
set omnifunc=syntaxcomplete
set autoindent
filetype plugin indent on
set shiftround
set shiftwidth=4
set smarttab
set showmatch


" Search
" Clear search when ,/ pressed
nmap <silent> ,/ :nohlsearch<CR>
set ignorecase
set smartcase


" File editing
set undolevels=1000
set wildignore=*.swp,*.bak,*.pyc,*.class,*.o,*.so
set title
set visualbell
set noerrorbells
set nobackup
set noswapfile
set number


" -----
" Plugin specific options
" -----


" Powerline
set laststatus=2
let g:Powerline_symbols = 'fancy'


" Ctrlp
let g:ctrlp_max_height = 30
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=*/coverage/*


" Pymode
let g:pymode_python = 'python'
let g:pymode_rope_goto_definition_bind = '<C-S-g>'
let g:pymode_doc_bind = '<C-S-d>'
let g:pymode_run_bind = '<C-S-e>'
let g:pymode_folding = 0
let g:pymode_motion = 1
