set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Specify a directory for plugins
call plug#begin('~/.vim/plugged')

" basic stuff
Plug 'ervandew/screen'
Plug 'ggandor/lightspeed.nvim'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
Plug 'scrooloose/nerdtree'
Plug 'szw/vim-maximizer'
Plug 'tomlion/vim-solidity'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" gruvbuddies
Plug 'eddyekofo94/gruvbox-flat.nvim'
Plug 'gruvbox-community/gruvbox'
Plug 'sainnhe/gruvbox-material'

" nvim sauce
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" nvim lsp
Plug 'hrsh7th/cmp-buffer' " 
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/nvim-cmp'
Plug 'neovim/nvim-lspconfig'
" not sure if I want snippets
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
"Plug 'glepnir/lspsaga.nvim'
" remember to update this after glepnir fixes it
Plug 'jasonrhansen/lspsaga.nvim', {'branch': 'finder-preview-fixes'}

" Initialize plugin system
call plug#end()

colorscheme gruvbox-flat
let g:gruvbox_flat_style="dark"
let g:airline_theme = 'bubblegum'

" treeshitter
lua require'nvim-treesitter.configs'.setup { indent = { enable = true }, highlight = { enable = true }, incremental_selection = { enable = true } }

" USE THESE FOR LSP! error: '✘', warning: '⚠'

" close nerdtree if it's the last tab
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree")
      \ && b:NERDTree.isTabTree()) | q | endif

