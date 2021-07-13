" upon saving, delete trailing whitespace
autocmd BufWritePre *.py :%s/\s\+$//e

" Open a .py file, hit space + p to tmux a script with ipython
" visually select a block of code and type space + v to send it to ipython
" ipyhon tmux integration {{{
let g:ScreenImpl = "Tmux"

" Open an ipython3 shell below current pane
autocmd FileType python map <LocalLeader>P :ScreenShell ipython<CR>

" Open an ipython3 shell above urrent pane
autocmd FileType python map <LocalLeader>p :ScreenShell! ipython<CR>

"autocmd FileType python map <LocalLeader>p :IPython!  <CR>
"
" Close whichever shell is running.
autocmd FileType python map <LocalLeader>q :ScreenQuit<CR>
" Send current line to python and move to next line.
autocmd FileType python map <LocalLeader>rp V:ScreenSend<CR>
" Send visual selection to python and move to next line.
autocmd FileType python map <LocalLeader>v :ScreenSend<CR>`>0j
" Send a carriage return line to python.
autocmd FileType python map <LocalLeader>a :call g:ScreenShellSend("\r")<CR>
" Clear screen.
autocmd FileType python map <LocalLeader>L
                        \ :call g:ScreenShellSend('!clear')<CR>
" Start a time block to execute code in.
"autocmd FileType python map <LocalLeader>t
"                        \ :call g:ScreenShellSend('%%time')<CR>
" Start a timeit block to execute code in.
autocmd FileType python map <LocalLeader>tt
                        \ :call g:ScreenShellSend('%%timeit')<CR>
" Start a debugger repl to execute code in.
autocmd FileType python map <LocalLeader>db
                        \ :call g:ScreenShellSend('%%debug')<CR>
" Start a profiling block to execute code in.
autocmd FileType python map <LocalLeader>pr
                        \ :call g:ScreenShellSend('%%prun')<CR>
" Print the current working directory.
autocmd FileType python map <LocalLeader>gw
                        \ :call g:ScreenShellSend('!pwd')<CR>
" Set working directory to current file's folder.
function! SetWD()
        let wd = '!cd ' . expand('%:p:h')
        :call g:ScreenShellSend(wd)
endfunction
autocmd FileType python map <LocalLeader>sw :call SetWD()<CR>
" Get ipython help for word under cursor. Complement it with Shift + K.
function! GetHelp()
        let w = expand("<cword>") . "??"
        :call g:ScreenShellSend(w)
endfunction
autocmd FileType python map <LocalLeader>h :call GetHelp()<CR>
" Get `dir` help for word under cursor.
function! GetDir()
        let w = "dir(" . expand("<cword>") . ")"
        :call g:ScreenShellSend(w)
endfunction
"autocmd FileType python map <LocalLeader>d :call GetDir()<CR>
function! s:get_visual_selection()
endfunction
" Get `?` help for word under cursor.
function! GetHelpMagic()
        let foo_tmp =  GetVisual()
        let w = "?".foo_tmp
        :call g:ScreenShellSend(w)
endfunction
autocmd FileType python map <LocalLeader>dc :call GetHelpMagic()<CR>

" Get `dir` help for word under cursor.
function! GetLen()
        let w = "len(" . expand("<cword>") . ")"
        :call g:ScreenShellSend(w)
        echo  w
endfunction
autocmd FileType python map <LocalLeader>l :call GetLen()<CR>
"}}}
"
" run file
autocmd FileType python nnoremap  <buffer> <leader>r :exec '!python' shellescape(@%, 1)<cr>
" {{{ misc functinons
" gets the selected text in visual mode
function! GetVisual()
        " Why is this not a built-in Vim script function?!
        let [lnum1, col1] = getpos("'<")[1:2]
        let [lnum2, col2] = getpos("'>")[1:2]
        let lines = getline(lnum1, lnum2)
        let lines[-1] = lines[-1][: col2 - (&selection == 'inclusive' ? 1 : 2)]
        let lines[0] = lines[0][col1 - 1:]
        return join(lines, "\n")
endfunction
"}}}

