" Allow unsaved buffers to lose focus
set hidden
" Line numbers
set number
" Do not select line numbers
set mouse=a
" Highlight search results
set hlsearch
" Makes search act like search in modern browsers
set incsearch
" Syntax HLing
syntax on
" Show matching brackets when text indicator is over them
set showmatch
" Scroll earlier then end of screen
set scrolloff=15
" Auto change directory
set autochdir
" How many tenths of a second to blink when matching brackets
set mat=2
"Always show current position
set ruler
" Set to auto read when a file is changed from the outside
set autoread
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile
" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8
" Use Unix as the standard file type
set ffs=unix,dos,mac
" Use spaces instead of tabs
set expandtab
" Be smart when using tabs ;)
set smarttab
" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4
" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
map <space> /
map <c-space> ?

set ai "Auto indent
set si "Smart indent

set laststatus=2
let g:Powerline_symbols = 'fancy'

" F7 to toggle paste mode
map <F7> :set invpaste<CR>
set pastetoggle=<F7>

" F6 to toggle paste mode
map <F6> :set invnumber<CR>
set pastetoggle=<F6>
