setlocal updatetime=20000
setlocal iskeyword-=38
setlocal conceallevel=2
setlocal concealcursor=


let g:vimtex_syntax_custom_cmds = [
        \ {'name': 'vct', 'mathmode': 1, 'argstyle': 'bold'},
        \ {'name': 'R', 'mathmode': 1, 'concealchar': 'ℝ'},
        \]

"if has("patch-7.4.354")
"    " Indents word-wrapped lines as much as the 'parent' line
"    setlocal breakindent
"    setlocal nowrap
"    " Ensures word-wrap does not split words
"    setlocal formatoptions=l
"    setlocal linebreak
"    setlocal showbreak=->\ "
"endif

nnoremap <silent><buffer> <localleader>s :edit ~/Library/texmf/tex/latex/myStyle.sty<cr>
