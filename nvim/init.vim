"" Intzy's .vimrc

"""""""""""""""""""""""""""""""""""""""""""""""""""
""""       LEADER KEYS
"""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <space> <nop>
let g:mapleader = "\<space>"
let g:maplocalleader = "\\"

"""""""""""""""""""""""""""""""""""""""""""""""""""
""""       NEOVIM PROVIDERS
"""""""""""""""""""""""""""""""""""""""""""""""""""
if has('nvim')
    let g:python3_host_prog = '~/.pyenv/versions/nvim/bin/python'
    let g:node_host_prog = '/usr/local/bin/neovim-node-host'
    let g:loaded_ruby_provider = 0
    let g:loaded_perl_provider = 0
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""
""""       VIM-PLUG
"""""""""""""""""""""""""""""""""""""""""""""""""""

" Install vim-plug and all plugins if not already installed.
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()

" Package manager
    Plug 'junegunn/vim-plug'

" Util
    Plug 'nvim-lua/plenary.nvim'

" LSP, Diagnostics, Linting, Formatting
    Plug 'neovim/nvim-lspconfig'
    Plug 'jose-elias-alvarez/null-ls.nvim'
    Plug 'kyazdani42/nvim-web-devicons'
    Plug 'folke/trouble.nvim'
    Plug 'kosayoda/nvim-lightbulb'

" Autocompletion
    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'hrsh7th/cmp-buffer'
    Plug 'hrsh7th/cmp-path'
    Plug 'hrsh7th/cmp-cmdline'
    Plug 'hrsh7th/nvim-cmp'
    Plug 'quangnguyen30192/cmp-nvim-ultisnips'

    " Plug 'dense-analysis/ale'

" File navigation
    " .vim/plugin/fern.vim
    Plug 'lambdalisue/fern.vim'
    Plug 'lambdalisue/fern-hijack.vim'
    Plug 'lambdalisue/fern-git-status.vim'
    Plug 'yuki-yano/fern-preview.vim'
    if has('nvim') && !has('nvim-0.8')
        " Fix bug for Fern
        Plug 'antoinemadec/FixCursorHold.nvim'
    endif

" File-specific support
    Plug 'lervag/vimtex'
    Plug 'JuliaEditorSupport/julia-vim'
    Plug 'vimwiki/vimwiki'

" Snippets
    Plug 'sirver/UltiSnips'
    Plug 'honza/vim-snippets'

" Editing
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-unimpaired'
    Plug 'tpope/vim-commentary'

" Git support
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-rhubarb'

" REPL
    Plug 'axvr/zepl.vim'

" Colour Schemes
    Plug 'ellisonleao/gruvbox.nvim'

" UI
    Plug 'szw/vim-maximizer'

" Test
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'nvim-telescope/telescope-fzf-native.nvim', {'do': 'make'}
    " Plug 'mfussenegger/nvim-dap'
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

call plug#end()


"""""""""""""""""""""""""""""""""""""""""""""""""""
""""       SETTINGS
"""""""""""""""""""""""""""""""""""""""""""""""""""
"" INDENTATION
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set shiftround
set autoindent
set smartindent

"" BEHAVIOUR
set nowrap
set scrolloff=999
set mouse=a
set iskeyword=@,48-57,192-255,_,-
set noerrorbells
set updatetime=200

"" INTERFACE
set number relativenumber
set showcmd
set colorcolumn=100
set laststatus=2
set signcolumn=number
set cmdheight=1
set showmode
set shortmess+=cs
set ruler
set splitbelow
set splitright

"" COLOUR SCHEMES
set termguicolors
set background=dark
let g:gruvbox_contrast_dark = 'hard'
colorscheme gruvbox

"" Use system clipboard for all yank and put operations
" set clipboard=unnamed

"" SPELLING
set spell spelllang=en_ca

"" SEARCHING
set hlsearch
set incsearch
set ignorecase
noremap <silent> <leader>h :nohlsearch<cr>

"" COMMAND_LINE AUTO-EXPANSION
set wildmenu
set wildmode=longest,list,full
set wildchar=<Tab>

""" PROJECT-SPECIFIC SETTINGS
set exrc
set secure

set completeopt=menu,menuone,noselect

"""""""""""""""""""""""""""""""""""""""""""""""""""
""""       MAPPINGS
"""""""""""""""""""""""""""""""""""""""""""""""""""

"" Window navigation
nnoremap <leader>wh <c-W>h
nnoremap <leader>wl <c-W>l
nnoremap <leader>wj <c-W>j
nnoremap <leader>wk <c-W>k
nnoremap <leader>wo <c-W>o
nnoremap <leader>wq <c-W>q
nnoremap <leader>ws <c-W>s
nnoremap <leader>wv <c-W>v
nnoremap <leader>wH <c-W>H
nnoremap <leader>wL <c-W>L
nnoremap <leader>wJ <c-W>J
nnoremap <leader>wK <c-W>K
nnoremap <silent> <leader>wm :MaximizerToggle<cr>
nnoremap <A-Left> <C-w>h
nnoremap <A-Down> <C-w>j
nnoremap <A-Up> <C-w>k
nnoremap <A-Right> <C-w>l
tnoremap <A-Left> <C-\><C-N><C-w>h
tnoremap <A-Down> <c-\><c-n><c-w>j
tnoremap <A-Up> <c-\><c-n><c-w>k
tnoremap <A-Right> <C-\><C-N><C-w>l
inoremap <A-Left> <C-\><C-N><C-w>h
inoremap <A-Down> <C-\><C-N><C-w>j
inoremap <A-Up> <C-\><C-N><C-w>k
inoremap <A-Right> <C-\><C-N><C-w>l

" Terminal commands
tnoremap <esc> <C-\><C-n>

" Scrolling
function! Scroll(move)
    let size=winheight(0)
    if a:move ==? 'up'
        let key='\<C-Y>'
    elseif a:move ==? 'down'
        let key='\<C-E>'
    elseif a:move ==? 'left'
        let key='zh'
    elseif a:move ==?'right'
        let key='zl'
    endif
    execute 'normal! ' . size/5 . key
endfunction
nnoremap <silent> <c-y> :call Scroll('up')<cr>
nnoremap <silent> <c-e> :call Scroll('down')<cr>
nnoremap <silent> <c-l> :call Scroll('right')<cr>
nnoremap <silent> <c-h> :call Scroll('left')<cr>

" Undo Redo
nnoremap U <c-R>
nnoremap <c-R> U

" Copying into clipboard
nnoremap Y "+y
vnoremap Y "+y

" <leader>v... commands
nnoremap <silent> <leader>ve :edit $MYVIMRC<cr>
nnoremap <silent> <leader>vs :source %:p<cr>
nnoremap          <leader>vw :echo @%<cr>
nnoremap          <leader>vh :cd %:h<cr>:pwd<cr>
nnoremap <silent> <leader>vu :PlugUpdate<cr>
nnoremap <silent> <leader>vi :PlugInstall<cr>
nnoremap <silent> <leader>vc :PlugClean<cr>
nnoremap <silent> <leader>vz :edit ~/.zshrc<cr>

" Make common commands case-insensitive
command! W w
command! Wq wq
command! Q q

" Fix indentation
nnoremap <silent> <leader>ei gg=G<C-o>

"""""""""""""""""""""""""""""""""""""""""""""""""""
""""       Load Lilypond
"""""""""""""""""""""""""""""""""""""""""""""""""""
filetype off
set runtimepath+=/usr/local/share/lilypond/2.22.2/vim/
filetype on

"""""""""""""""""""""""""""""""""""""""""""""""""""
""""       Snippets
"""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <silent> <leader>u :UltiSnipsEdit<cr>
let g:UltiSnipsEditSplit = 'normal'
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
let g:UltiSnipsListSnippets = ''

"""""""""""""""""""""""""""""""""""""""""""""""""""
""""       Vim Fugitve
"""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <silent> <leader>gg :G<cr>
nnoremap <silent> <leader>gd :Gvdiffsplit<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""
""""       Maximizer
"""""""""""""""""""""""""""""""""""""""""""""""""""
let g:maximizer_set_default_mapping = 0
" Mapping defined in window mappings

"""""""""""""""""""""""""""""""""""""""""""""""""""
""""       Vimspector
"""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <leader>b <Plug>VimspectorToggleBreakpoint
nmap <leader>? <Plug>VimspectorToggleConditionalBreakpoint

nnoremap <leader>dj :e .vimspector.json<cr>:pwd<cr>

let g:vimspector_install_gadgets = ['debugpy', 'CodeLLDB', 'vscode-node-debug2']
let g:vimspector_ui_mode = 'horizontal'

nmap <leader>d<cr> <Plug>VimspectorContinue
nmap <leader>d<esc> <Plug>VimspectorStop
nmap <leader>dr <Plug>VimspectorRestart
nmap <leader>dq :call vimspector#Reset()<cr>
nmap <leader>dp <Plug>VimspectorPause

nmap <leader>df <Plug>VimspectorAddFunctionBreakpoint
nmap <leader>dm <Plug>VimspectorRunToCursor

nmap <S-left> <Plug>VimspectorContinue
nmap <S-down> <Plug>VimspectorStepOver
nmap <S-right> <Plug>VimspectorStepInto
nmap <S-up> <Plug>VimspectorStepOut

nmap <leader>d[ <Plug>VimspectorUpFrame
nmap <leader>d] <Plug>VimspectorDownFrame

nmap <leader>de <Plug>VimspectorBalloonEval
xmap <leader>de <Plug>VimspectorBalloonEval

" API Unstable
nnoremap <leader>dv :call win_gotoid(g:vimspector_session_windows.variables)<cr>
nnoremap <leader>dw :call win_gotoid(g:vimspector_session_windows.watches)<cr>
nnoremap <leader>do :call win_gotoid(g:vimspector_session_windows.output)<cr>
nnoremap <leader>dc :call win_gotoid(g:vimspector_session_windows.code)<cr>
nnoremap <leader>ds :call win_gotoid(g:vimspector_session_windows.stack_trace)<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""
"""       Fern
""""""""""""""""""""""""""""""""""""""""""""""""""
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

""""""""""""""""""""""""""""""""""""""""""""""""""
"""       Vimtex
""""""""""""""""""""""""""""""""""""""""""""""""""
let g:vimtex_view_method = 'skim'
let g:vimtex_imaps_enabled = 0
let g:vimtex_compiler_progname = 'nvr'
let g:vimtex_quickfix_mode = 0
let g:vimtex_fold_enabled = 0

" Clean directory when quitting vim
augroup Vimtex
    autocmd!
    autocmd User VimtexEventQuit VimtexClean
augroup END

" Auto-save so Compiler runs when there is no activity
augroup AutoSave
    autocmd!
    autocmd CursorHold,CursorHoldI * silent! :write
augroup end

" Enable Shell Escape
let g:vimtex_compiler_latexmk = {
\ 'options' : [
\   '-pdf',
\   '-shell-escape',
\   '-verbose',
\   '-file-line-error',
\   '-synctex=1',
\   '-interaction=nonstopmode',
\ ],
\}

"""""""""""""""""""""""""""""""""""""""""""""""""""
""""       ALE
"""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""
"""       Trouble
""""""""""""""""""""""""""""""""""""""""""""""""""
lua << EOF
    require("trouble").setup {}
EOF

nnoremap <leader>xx <cmd>TroubleToggle<cr>
nnoremap <leader>xw <cmd>TroubleToggle workspace_diagnostics<cr>
nnoremap <leader>xd <cmd>TroubleToggle document_diagnostics<cr>
nnoremap <leader>xq <cmd>TroubleToggle quickfix<cr>
nnoremap <leader>xl <cmd>TroubleToggle loclist<cr>
nnoremap <leader>xr <cmd>TroubleToggle lsp_references<cr>
nnoremap <leader>xd <cmd>TroubleToggle lsp_definitions<cr>
nnoremap <leader>xt <cmd>TroubleToggle lsp_type_definitions<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""
"""       LSP-Config
""""""""""""""""""""""""""""""""""""""""""""""""""
lua require('config/cmp')
lua require('config/lsp')
lua require('config/null-ls')
lua << EOF
require('nvim-lightbulb').setup({autocmd = {enabled = true}})
EOF

"""""""""""""""""""""""""""""""""""""""""""""""""""
""""       Treesitter
"""""""""""""""""""""""""""""""""""""""""""""""""""
lua require('config/treesitter')

"""""""""""""""""""""""""""""""""""""""""""""""""""
""""       Telescope
"""""""""""""""""""""""""""""""""""""""""""""""""""
lua require('config/telescope')
