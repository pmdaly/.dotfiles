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

" sets nerd tree to start up on vim load
"autocmd vimenter * NERDTree | wincmd p
" close nerdtree if it's the last tab
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree")
      \ && b:NERDTree.isTabTree()) | q | endif
hi CursorLine term=bold cterm=bold guibg=Grey40

autocmd filetype python     setlocal ts=4 sts=4 sw=4
autocmd filetype tex        setlocal ts=2 sts=2 sw=2
autocmd filetype html       setlocal ts=2 sts=2 sw=4
autocmd filetype javascript setlocal ts=2 sts=2 sw=4

" Floating Term
let s:float_term_border_win = 0
let s:float_term_win = 0
function! FloatTerm(...)
  " Configuration
  let height = float2nr((&lines - 2) * 0.6)
  let row = float2nr((&lines - height) / 2)
  let width = float2nr(&columns * 0.6)
  let col = float2nr((&columns - width) / 2)
  " Border Window
  let border_opts = {
        \ 'relative': 'editor',
        \ 'row': row - 1,
        \ 'col': col - 2,
        \ 'width': width + 4,
        \ 'height': height + 2,
        \ 'style': 'minimal'
        \ }
  " Terminal Window
  let opts = {
        \ 'relative': 'editor',
        \ 'row': row,
        \ 'col': col,
        \ 'width': width,
        \ 'height': height,
        \ 'style': 'minimal',
        \ }
  let top = "╭" . repeat("─", width + 2) . "╮"
  let mid = "│" . repeat(" ", width + 2) . "│"
  let bot = "╰" . repeat("─", width + 2) . "╯"
  let lines = [top] + repeat([mid], height) + [bot]
  let bbuf = nvim_create_buf(v:false, v:true)
  call nvim_buf_set_lines(bbuf, 0, -1, v:true, lines)
  let s:float_term_border_win = nvim_open_win(bbuf, v:true, border_opts)
  let buf = nvim_create_buf(v:false, v:true)
  let s:float_term_win = nvim_open_win(buf, v:true, opts)
  " Styling
  hi FloatWinBorder guifg=#87bb7c
  call setwinvar(s:float_term_border_win, '&winhl', 'Normal:FloatWinBorder')
  call setwinvar(s:float_term_win, '&winhl', 'Normal:Normal')
  if a:0 == 0
    terminal
  else
    call termopen(a:1)
  endif
  startinsert
  " Close border window when terminal window close
  autocmd TermClose * ++once :bd! | call nvim_win_close(s:float_term_border_win, v:true)
endfunction

