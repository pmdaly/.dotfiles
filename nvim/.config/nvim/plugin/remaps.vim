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

" lsp
nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gD <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> gi <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> K <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> <C-k> <cmd>lua vim.lsp.buf.signature_help()<CR>

" better vim split movement
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" maximizer
nnoremap <leader>m :MaximizerToggle!<CR>

" git
nnoremap <leader>gs :G<CR>
nnoremap <leader>gd :G diff %<CR>
nnoremap <leader>gc :G commit<CR>
