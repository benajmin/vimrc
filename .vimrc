" Display line numbers
set nu

" Indentation settings
set tabstop=2
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

" Install vimplug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-sleuth'
call plug#end()

" Run PlugInstall if there are missing plugins
if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
