set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Specify a directory for plugins
call plug#begin('~/.vim/plugged')

" Plug 'ambv/black'
Plug 'bling/vim-airline'
Plug 'ervandew/screen'
Plug 'gruvbox-community/gruvbox'
Plug 'honza/vim-snippets'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'sainnhe/gruvbox-material'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'

Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
Plug 'ggandor/lightspeed.nvim'

Plug 'tomlion/vim-solidity'
Plug 'puremourning/vimspector', {'do': './install_gadget.py --force-enable-node --enable-python'}
Plug 'szw/vim-maximizer'

" does a lua port work?
Plug 'eddyekofo94/gruvbox-flat.nvim'

" Initialize plugin system
call plug#end()

filetype plugin indent on
syntax on

" Fix italics in Vim
" if !has('nvim')
"   let &t_ZH="\e[3m"
"   let &t_ZR="\e[23m"
" endif

colorscheme gruvbox-flat
let g:gruvbox_flat_style="dark"
"colorscheme gruvbox-material
"let gruvbox_material_background='medium'
"let g:airline_theme = 'gruvbox_material'
"colorscheme gruvbox
"let gruvbox_contrast_dark = 'medium'
"let g:airline_theme = 'gruvbox'

" treeshitter
lua require'nvim-treesitter.configs'.setup { highlight = { enable = true } }
"
" ultsnips use tabbing
"let g:UltiSnipsExpandTrigger = '<tab>'
"let g:UltiSnipsJumpForwardTrigger = '<tab>'
"let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
let g:coc_snippet_next = '<tab>'

let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'

" close nerdtree if it's the last tab
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree")
      \ && b:NERDTree.isTabTree()) | q | endif
hi CursorLine term=bold cterm=bold guibg=Grey40

autocmd filetype python, solidity setlocal ts=4 sts=4 sw=4

