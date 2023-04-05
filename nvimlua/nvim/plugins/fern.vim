let hide_tex_files = '\%(\.pdf\|\.aux\|\.log\|\.fls\|\.out\|\.gz\|\.fdb_latexmk\)\+'
let hide_python_files = '\%(__pycache__\)$'
let g:fern#default_exclude = hide_tex_files . '\|' . hide_python_files
let g:fern#disable_default_mappings = 1
let g:fern#drawer_width = 35
nmap <silent> <leader>f :Fern . -drawer -toggle<cr>

augroup fern-customize
  autocmd! *
  autocmd FileType fern call s:init_fern()
  " autocmd FileType fern call s:fern_preview()
augroup END


function! s:init_fern() abort
    nnoremap <Plug>(fern-close-drawer) :<C-u>FernDo close -drawer -stay<CR>

    nmap <buffer><silent> <Plug>(fern-action-open-and-close)
	\ <Plug>(fern-action-open)
	\ <Plug>(fern-close-drawer)

    nmap <buffer><expr> <Plug>(fern-action-open-and-close-or-enter)
	\ fern#smart#leaf(
	\   "\<Plug>(fern-action-open-and-close)",
	\   "\<Plug>(fern-action-enter)",
	\ )

    nmap <buffer><expr> <Plug>(fern-action-open-and-close-or-expand)
	\ fern#smart#leaf(
	\   "\<Plug>(fern-action-open-and-close)",
	\   "\<Plug>(fern-action-expand)",
	\ )

    nmap <buffer> <esc> <Plug>(fern-close-drawer)
    nmap <buffer> o <Plug>(fern-action-open-and-close-or-enter)
    nmap <buffer> O <Plug>(fern-action-leave)
    nmap <buffer> x <Plug>(fern-action-open:system)

    nmap <buffer> l <Plug>(fern-action-open-and-close-or-expand)
    nmap <buffer> h <Plug>(fern-action-collapse)

    nmap <buffer> r <Plug>(fern-action-rename:bottom)
    nmap <buffer> K <Plug>(fern-action-new-dir)
    nmap <buffer> N <Plug>(fern-action-new-file)
    nmap <buffer> D <Plug>(fern-action-trash)
    nmap <buffer> ! <Plug>(fern-action-hidden)

    nmap <buffer> - <Plug>(fern-action-mark:toggle)

    nmap <buffer> C <Plug>(fern-action-clipboard-copy)
    nmap <buffer> M <Plug>(fern-action-clipboard-move)
    nmap <buffer> P <Plug>(fern-action-clipboard-paste)

    nmap <buffer> z <Plug>(fern-action-zoom)
    nmap <buffer> Z <Plug>(fern-action-zoom:reset)

endfunction

" function! s:fern_preview() abort
"     nmap <silent> <buffer> p     <Plug>(fern-action-preview:toggle)
"     nmap <silent> <buffer> <C-p> <Plug>(fern-action-preview:auto:toggle)
"     nmap <silent> <buffer> <C-j> <Plug>(fern-action-preview:scroll:down:half)
"     nmap <silent> <buffer> <C-k> <Plug>(fern-action-preview:scroll:up:half)

"     nmap <silent> <buffer> <expr> <Plug>(fern-quit-or-close-preview) fern_preview#smart_preview("\<Plug>(fern-action-preview:close)", ":q\<CR>")
"     nmap <silent> <buffer> q <Plug>(fern-quit-or-close-preview)
" endfunction
