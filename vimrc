set nocompatible
syntax on

filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

Plugin 'mileszs/ack.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'micha/vim-colors-solarized'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"

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
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='solarized'

"for ruby, autoindent with two spaces, always expand tabs
autocmd FileType ruby,haml,eruby,yaml,html set ai sw=2 sts=2 et

syntax enable

set incsearch
set cursorline
set tabstop=4
set shiftwidth=4
set softtabstop=4
set backspace=indent,eol,start

