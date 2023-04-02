" ftplugin/lilypond.vim

setlocal commentstring=%%s

nnoremap <silent><buffer> <localleader>l :!lilypond %<cr>
nnoremap <silent><buffer> <localleader>m :!lilypond main.ly<cr>
