set nocompatible
syntax on

" ------------------------------------------------------------------
" Vundle setup
" ------------------------------------------------------------------
filetype off                  " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" call vundle#begin('~/some/alternative/path/here')
" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
""""""""""""""""""""""""""""""""""""""""
" My plugins
Plugin 'mileszs/ack.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'micha/vim-colors-solarized'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'ctrlpvim/ctrlp.vim'
"
""""""""""""""""""""""""""""""""""""""""
call vundle#end()            " required
filetype plugin indent on    " required
" ------------------------------------------------------------------

" ------------------------------------------------------------------
" Gui setup
" ------------------------------------------------------------------
if has("gui_macvim")
	"set guifont=Envy_Code_R:h16
	set guifont=Hack\ Nerd\ Font:h14
	set linespace=4
	set guioptions=acegm
endif

" ------------------------------------------------------------------
" Solarized Colorscheme Config ":help solarized"
" ------------------------------------------------------------------
let g:solarized_termcolors=256    "default value is 16
let g:solarized_hitrail=1    "default value is 0
set background=dark
colorscheme solarized

" ------------------------------------------------------------------
" airline config
" ------------------------------------------------------------------
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='solarized'
let g:airline_inactive_collapse=1
let g:airline_powerline_fonts = 1

" ------------------------------------------------------------------
" VIM options settings
" ------------------------------------------------------------------
syntax enable
set incsearch
set ignorecase
set cursorline
set tabstop=4
set shiftwidth=4
set softtabstop=4
set backspace=indent,eol,start

"for ruby, autoindent with two spaces, always expand tabs
autocmd FileType ruby,haml,eruby,yaml,html set ai sw=2 sts=2 et


