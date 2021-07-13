let maplocalleader = " "

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

