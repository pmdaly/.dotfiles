let mapleader = " "

" set esc to jj and leader to space
inoremap jj <Esc>
nnoremap ; :

" long wrapped lines
nnoremap k gk
nnoremap j gj

" nerdtree
nnoremap <C-n> :NERDTreeToggle<CR>

" fzf / telescope
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fp <cmd>lua require('telescope.builtin').git_files()<cr>
nnoremap <leader>gg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
nnoremap <leader>fd <cmd>lua require('telescope.builtin').git_files({
      \ prompt_title = "< VimRC >",
      \ cwd = "~/.dotfiles",
      \ hidden = true})<cr>

" better vim split movement
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" coc completion
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)


" maximizer
nnoremap <leader>m :MaximizerToggle!<CR>

"vimspector
fun! GotoWindow(id)
    call win_gotoid(a:id)
    MaximizerToggle
endfun

" vimspector Debugger remaps
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
