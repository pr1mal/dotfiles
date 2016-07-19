set nocompatible
syntax enable

set incsearch
set cursorline
set tabstop=4
set shiftwidth=4
set softtabstop=4
set backspace=indent,eol,start
syntax on

"for ruby, autoindent with two spaces, always expand tabs
autocmd FileType ruby,haml,eruby,yaml,html set ai sw=2 sts=2 et

filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

Bundle 'mileszs/ack.vim'

Bundle 'kien/ctrlp.vim'

Bundle 'vim-scripts/mru.vim'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree'

Bundle 'ervandew/supertab'
let g:SuperTabDefaultCompletionType = "context"

Bundle 'tpope/vim-fugitive'
Bundle 'jacquesbh/vim-showmarks'
Bundle 'kchmck/vim-coffee-script'
Bundle 'vim-scripts/nginx.vim'
Bundle 'airblade/vim-gitgutter'

Bundle 'majutsushi/tagbar'
let g:tagbar_type_go = {
	\ 'ctagstype' : 'go',
	\ 'kinds'     : [
		\ 'p:package',
		\ 'i:imports:1',
		\ 'c:constants',
		\ 'v:variables',
		\ 't:types',
		\ 'n:interfaces',
		\ 'w:fields',
		\ 'e:embedded',
		\ 'm:methods',
		\ 'r:constructor',
		\ 'f:functions'
	\ ],
	\ 'sro' : '.',
	\ 'kind2scope' : {
		\ 't' : 'ctype',
		\ 'n' : 'ntype'
	\ },
	\ 'scope2kind' : {
		\ 'ctype' : 't',
		\ 'ntype' : 'n'
	\ },
	\ 'ctagsbin'  : 'gotags',
	\ 'ctagsargs' : '-sort -silent'
	\ }

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList          - list configured plugins
" :PluginInstall(!)    - install (update) plugins
" :PluginSearch(!) foo - search (or refresh cache first) for foo
" :PluginClean(!)      - confirm (or auto-approve) removal of unused plugins
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

if has("gui_macvim")
	set guifont=Envy_Code_R:h15
	set guioptions=acegm
	" ------------------------------------------------------------------
	" Solarized Colorscheme Config ":help solarized"
	" ------------------------------------------------------------------
	let g:solarized_termcolors=256    "default value is 16
	let g:solarized_hitrail=1    "default value is 0
	set background=light
	colorscheme solarized
	" ------------------------------------------------------------------

	" The following items are available options, but do not need to be
	" included in your .vimrc as they are currently set to their defaults.

	" let g:solarized_termtrans=0
	" let g:solarized_degrade=0
	" let g:solarized_bold=1
	" let g:solarized_underline=1
	" let g:solarized_italic=1
	" let g:solarized_contrast="normal"
	" let g:solarized_visibility="normal"
	" let g:solarized_diffmode="normal"
	" let g:solarized_menu=1
endif


