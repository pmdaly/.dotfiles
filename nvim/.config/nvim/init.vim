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
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
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
Plug 'dense-analysis/ale'

Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'

Plug 'tomlion/vim-solidity'
Plug 'puremourning/vimspector', {'do': './install_gadget.py --force-enable-node --enable-python'}
Plug 'szw/vim-maximizer'

" does a lua port work?
Plug 'eddyekofo94/gruvbox-flat.nvim'

" Initialize plugin system
call plug#end()

filetype plugin indent on
syntax on

colorscheme gruvbox-flat
let g:gruvbox_flat_style="dark"
let g:airline_theme = 'bubblegum'

" treeshitter
lua require'nvim-treesitter.configs'.setup { highlight = { enable = true } }

" ale icons
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'

" close nerdtree if it's the last tab
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree")
      \ && b:NERDTree.isTabTree()) | q | endif

