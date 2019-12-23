" Display line numbers
set nu

" Indentation settings
set expandtab
set tabstop=2
set shiftwidth=2
set autoindent
set ruler

" Syntax highlighting
syntax on

" Toggle for paste mode. Allows proper indentation
set pastetoggle=<F3>

" Store temporary files in central directory
set undofile
set undodir=~/.vim/undodir
set backupdir=~/.vim/backupdir/
set directory=~/.vim/tmp/

" Searching
set ignorecase
set smartcase
set incsearch
set hlsearch

" Auto cd into directory
set autochdir

" Remove trailing whitespace
autocmd BufRead,BufWrite * if ! &bin | silent! %s/\s\+$//ge | endif

" jump to last known position when opening file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
endif

" Integrated man pages
runtime ftplugin/man.vim

" Auto read external changes
set autoread

" Keep 7 line buffer at top and bottom of screen
set so=7

" Configure backspace to work properly
set backspace=2

" Wrap lines with arrow and h,l keys
set whichwrap+=<,>,h,l,[,]

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500
