set autoindent    " align the new line indent with the previous line
set background=dark
set backspace=indent,eol,start  " more powerful backspacing
set cursorline    " highlist current line
set expandtab     " insert spaces when hitting TABs
set incsearch
set laststatus=2
set nohlsearch
set nomodeline
set number
set relativenumber
set scrolloff=8
set shiftround    " round indent to multiple of 'shiftwidth'
set shiftwidth=2  " operation >> indents 4 columns; << unindents 4 columns
set showcmd       " show last command entered in the bottom bar
set softtabstop=2 " insert/delete 4 spaces when hitting a TAB/BACKSPACE
set splitright
set tabstop=2     " a hard TAB displays as 4 columns
" set termguicolors
" set textwidth=88  " lines longer than 79 columns will be broken, let prettier decide this
set termguicolors
" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=50

autocmd filetype python, solidity setlocal ts=4 sts=4 sw=4
