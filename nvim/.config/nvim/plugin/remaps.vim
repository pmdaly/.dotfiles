let mapleader = " "

" set esc to jj and leader to space
inoremap jj <Esc>
nnoremap ; :

" nerdtree
nnoremap <C-n> :NERDTreeToggle<CR>

" fzf / telescope
"nmap <C-f> :Files<CR>
nmap <C-f> :lua require('telescope.builtin').find_files()<CR>
"nmap <C-p> :GFiles<CR>
nmap <C-p> :lua require('telescope.builtin').git_files()<CR>
" nmap <C-g> :Rg<CR>
nmap <C-g> :lua require('telescope.builtin').live_grep()<CR>

" better vim split movement
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" floatterm
nnoremap <C-t> :call FloatTerm()<CR>

" coc completion
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" maximizer


"vimspector
fun! GotoWindow(id)
    call win_gotoid(a:id)
    MaximizerToggle
endfun

" vimspector Debugger remaps
nnoremap <leader>m :MaximizerToggle!<CR>
nnoremap <leader>dd :call vimspector#Launch()<CR>
nnoremap <leader>dc :call GotoWindow(g:vimspector_session_windows.code)<CR>
nnoremap <leader>dt :call GotoWindow(g:vimspector_session_windows.tagpage)<CR>
nnoremap <leader>dv :call GotoWindow(g:vimspector_session_windows.variables)<CR>
nnoremap <leader>dw :call GotoWindow(g:vimspector_session_windows.watches)<CR>
nnoremap <leader>ds :call GotoWindow(g:vimspector_session_windows.stack_trace)<CR>
nnoremap <leader>do :call GotoWindow(g:vimspector_session_windows.output)<CR>
nnoremap <leader>de :call vimspector#Reset()<CR>

nnoremap <leader>dtcb :call vimspector#CleanLineBreakpoint()<CR>

nmap <leader>dl <Plug>VimspectorStepInto
nmap <leader>dj <Plug>VimspectorStepOver
nmap <leader>dk <Plug>VimspectorStepOut
nmap <leader>d_ <Plug>VimspectorRestart
nnoremap <leader>d<space> :call vimspector#Continue()<CR>

nmap <leader>drc <Plug>VimspectorRunToCursor
nmap <leader>dbp <Plug>VimspectorToggleBreakpoint
nmap <leader>dcbp <Plug>VimspectorToggleConditionalBreakpoint

" yarn test
nnoremap <leader>t :! yarn test<CR>

" prettier
command! -nargs=0 Prettier :CocCommand prettier.formatFile
nnoremap <leader>pp :CocCommand prettier.formatFile<CR>

" eslint
nnoremap <leader>ll :! yarn lint<CR>

" git
nnoremap <leader>gs :G<CR>
nnoremap <leader>gd :G diff %<CR>
nnoremap <leader>gc :G commit<CR>
