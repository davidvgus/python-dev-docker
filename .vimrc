set nocompatible              " be iMproved, required
"filetype off                  " required
set runtimepath+=~/.vim/bundle/YouCompleteMe
filetype on                 " required


" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
"
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-sensible'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdcommenter'
Plugin 'tpope/vim-surround'
Plugin 'kien/ctrlp.vim'
Plugin 'jeffkreeftmeijer/vim-numbertoggle'
Plugin 'davidhalter/jedi-vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'cjrh/vim-conda'
"Plugin 'keith/gist.vim.git'
Plugin 'molokai'
Plugin 'vim-airline/vim-airline'
Plugin 'terryma/vim-multiple-cursors'
"Plugin 'ervandew/supertab'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'gorodinskiy/vim-coloresque'

" All of your Plugins must be added before the following line
call vundle#end()            " required


"g:ycm_seed_identifiers_with_syntax = 1
"let g:SuperTabMappingForward = '<tab>'
let g:jedi#smart_auto_mappings = 1

set nowrap        " don't wrap lines
set tabstop=4     " a tab is four spaces
set shiftwidth=4  " number of spaces to use for autoindenting
set softtabstop=4
set expandtab
set backspace=indent,eol,start

                    " allow backspacing over everything in insert mode

set autoindent    " always set autoindenting on
set copyindent    " copy the previous indentation on autoindenting
set number        " always show line numbers
set numberwidth=5
set relativenumber
set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'
set showmatch     " set show matching parenthesis
set ignorecase    " ignore case when searching
set smartcase     " ignore case if search pattern is all lowercase,
                    "    case-sensitive otherwise
set smarttab      " insert tabs on the start of a line according to
                    "    shiftwidth, not tabstop
set hlsearch      " highlight search terms
set incsearch     " show search matches as you type





set history=1000         " remember more commands and search history
set undolevels=1000      " use many muchos levels of undo
set wildignore=*.swp,*.bak,*.pyc,*.class
set title                " change the terminal's title
set visualbell           " don't beep
set noerrorbells         " don't beep
nnoremap <silent> <C-l> :nohl<CR>



noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

"imap <c-u> <esc>viwUi

"Personal Settings.
"More to be added soon.
"execute pathogen#infect()

filetype plugin indent on
syntax on



let mapleader="\<space>"
nnoremap <leader>ev :split $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>nu :set relativenumber!<cr>

nnoremap <leader>gtd :YcmCompleter GoToDefinition<cr>



nnoremap <leader>H 0
nnoremap <leader>L $
nnoremap <leader>jj :bn<CR>
nnoremap <leader>kk :bp<CR>

inoremap jk <esc>

:iabbrev @@ davidg@radicalskeptic.net

"nnoremap <C-n> :call NumberToggle()<CR>

nnoremap <F3> :NERDTreeToggle<CR>

nnoremap <F2> :set invpaste paste?<CR>

"" Git
noremap <Leader>ga :Gwrite<CR>
noremap <Leader>gc :Gcommit<CR>
noremap <Leader>gsh :Gpush<CR>
noremap <Leader>gll :Gpull<CR>
noremap <Leader>gs :Gstatus<CR>
noremap <Leader>gb :Gblame<CR>
noremap <Leader>gd :Gvdiff<CR>
noremap <Leader>gr :Gremove<CR>

" put in bash config: stty -ixon
" in order to remap <c-s>
inoremap <C-S> <Esc>:update<cr>a
noremap <C-S> <Esc>:update<cr>
vnoremap <C-S> <Esc>:update<cr>


set pastetoggle=<F2>
set showmode

iabbr #b /**********************************************************************
iabbr #e **********************************************************************/

autocmd BufWritePre * :%s/\s\+$//e

nnoremap <leader>cw :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

nnoremap <leader>lp :call LoadPythonWords()<CR>
function! LoadPythonWords()
    badd ~/.pythonwords.py
    set statusline=%f\ %h%w%m%r\ %=%(%l,%c%V\ %=\ %P%)
    echo ""
endfunc

"let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
let g:pymode_python = 'python3'

set completeopt-=preview

"let g:gist_open_url=0
let g:ycm_confirm_extra_conf = 0
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1

set shell=/bin/bash

"set omnifunc=syntaxcomplete#Complete

set statusline=%f\ -\ FileType:\ %y
