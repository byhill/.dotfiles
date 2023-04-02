set tabstop=4
set shiftwidth=4
set expandtab
set softtabstop=4
set colorcolumn=89

set nospell

nnoremap <silent><buffer> <localleader>k :!python manage.py makemigrations<cr>
nnoremap <silent><buffer> <localleader>m :!python manage.py migrate<cr>
nnoremap <silent><buffer> <localleader>s :!sass --watch onehill/static/sass:onehill/static/css<cr>
