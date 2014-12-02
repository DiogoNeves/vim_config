" .vimrc file by Diogo Neves
" One day it may be awesome,
" today is not that day


" Clear previous state and commands that have side-effects
set nocompatible
" Key leader
let mapleader=","


" vimrc editing
" Open .vimrc using ,ev in a new tab
nmap <silent> <leader>ev :tabnew $MYVIMRC<CR>
autocmd! bufwritepost .vimrc nested source %


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
map <leader>, <esc>:tabprevious<CR>
map <leader>. <esc>:tabnext<CR>
map <leader>tn <esc>:tabnew<SPACE>
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
map <C-c-b> <esc>:CtrlPBuffer<CR>
let g:ctrlp_max_height = 30
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=*/coverage/*


" Pymode
" Adapted from: http://unlogic.co.uk/2013/02/08/vim-as-a-python-ide/#python-mode
" Python-mode
" Activate rope
" Keys:
" <Ctrl-c>f     Rope find occurrences
" <Leader>b     Set, unset breakpoint (g:pymode_breakpoint enabled)
" [[            Jump on previous class or function (normal, visual, operator modes)
" ]]            Jump on next class or function (normal, visual, operator modes)
" [M            Jump on previous class or method (normal, visual, operator modes)
" ]M            Jump on next class or method (normal, visual, operator modes)
let g:pymode_rope = 1
let g:pymode_rope_completion = 0

" Documentation (using Jedi)
let g:pymode_doc = 0

" Linting
let g:pymode_lint = 1
" Auto check on save
let g:pymode_lint_write = 1

" Support virtualenv (using virtualenv plugin)
let g:pymode_virtualenv = 0

" Enable breakpoints plugin
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_key = '<leader>b'

" syntax highlighting
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all

" Don't autofold code
let g:pymode_folding = 0

" NERDtree
map <leader>t :NERDTreeToggle<CR>
