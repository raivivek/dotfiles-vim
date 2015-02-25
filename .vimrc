call plug#begin('~/.vim/plugged')
"
" always enabled
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/syntastic'
Plug 'bling/vim-airline'
Plug 'scrooloose/nerdcommenter'
Plug 'xolox/vim-misc'
Plug 'docunext/closetag.vim'
Plug 'Lokaltog/vim-easymotion'
Plug 'altercation/vim-colors-solarized'
Plug 'tomtom/quickfixsigns_vim'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'Valloric/YouCompleteMe'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'tpope/vim-repeat'
Plug 'godlygeek/tabular'
Plug 'Shougo/unite.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-surround'
Plug 'othree/html5.vim'
Plug 'mattn/gist-vim'
Plug 'tpope/endwise'
Plug 'jiangmiao/auto-pairs'
Plug 'Valloric/MatchTagAlways'
Plug 'majutsushi/tagbar'
" on-demand loading
Plug 'sjl/gundo.vim', {'on': 'GundoToggle'}
Plug 'scrooloose/nerdtree', {'on':  'NERDTreeToggle'}
Plug 'xolox/vim-notes', {'on': 'Notes'}
Plug 'chrisbra/NrrwRgn', {'on': 'NrrwRgn'}
Plug 'mtth/scratch.vim', {'on': 'Scratch'}
" filetype specific plugins
Plug 'othree/javascript-libraries-syntax.vim', {'for': ['javascript', 'js']}
Plug 'pangloss/vim-javascript', {'for': ['javascript', 'js']}
Plug 'itspriddle/vim-jquery', {'for': ['javascript', 'js']}
Plug 'bitc/vim-hdevtools', {'for': 'haskell'}
Plug 'fs111/pydoc.vim', {'for': 'python'}

call plug#end()

" General {

    filetype plugin indent on

    set mouse=a
    set mousehide
    set shortmess+=filmnrxoOtT
    set ttyfast

    " set timeout timeoutlen=500 ttimeoutlen=1
    au FocusLost * silent! wa

    scriptencoding utf-8

    if !exists('g:no_autochdir')
        autocmd BufEnter * if bufname("") !~ "^\[A-Za-z0-9\]*://" | lcd %:p:h | endif
        " Always switch to the current file directory
    endif

    if filereadable(expand("~/.vim/plugged/vim-colors-solarized/colors/solarized.vim"))
        let g:solarized_termcolors=256
        let g:solarized_contrast="normal"
        let g:solarized_visibility="normal"
        color solarized
        set bg=light
    endif

    if has('cmdline_info')
        set ruler                   " Show the ruler
        set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " A ruler on steroids
        set showcmd                 " Show partial commands in status line and
        " Selected characters/lines in visual mode
    endif

    if has('statusline')
        set laststatus=2

        " Broken down into easily includeable segments
        set statusline=%<%f\                     " Filename
        set statusline+=%w%h%m%r                 " Options
        if !exists('g:override_spf13_bundles')
            set statusline+=%{fugitive#statusline()} " Git Hotness
        endif
        set statusline+=\ [%{&ff}/%Y]            " Filetype
        set statusline+=\ [%{getcwd()}]          " Current dir
        set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info
    endif

    highlight clear SignColumn      " SignColumn should match background
    highlight clear LineNr          " Current line number row will have same background color in relative mode

    " Instead of these two options, we can set a single directory for all
    " backups and temporary buffers. This is a better solution in case we don't
    " want our current buffer to be destroyed due to any IOError.
    "
    " set backupdir=~/.vimtmp
    " set directory=~/.vimtmp
    set nobackup
    set nowritebackup " Writes the buffer to the same file
    set noswapfile

    set list listchars=tab:▸\ ,trail:·
    set tags=./tags;/
    set mps+=<:>
    set backspace=2
    set smartcase
    set confirm
    set autoread
    set showmatch
    set smarttab
    set showcmd
    set incsearch
    set nu
    set novisualbell
    set visualbell t_vb=
    " set t_RV=
    set title
    set cursorcolumn
    set cursorline
    set viminfo='20,\"500
    set hidden
    set history=100
    set clipboard=unnamedplus
    set scrolloff=10
    set foldenable
" }

" Formatting {
"
    set autowrite
    set expandtab
    set shiftwidth=4
    set tabstop=4
    set softtabstop=4
    set nojoinspaces
    set shiftround
    set splitright
    set splitbelow
    set wrap

    augroup vimrcEx
        autocmd!

        autocmd FileType text setlocal spell
        autocmd FileType haskell,puppet,ruby,yml,html setlocal expandtab shiftwidth=2 softtabstop=2

        " When editing a file, always jump to the last known cursor position.
        " Don't do it for commit messages, when the position is invalid, or when
        " inside an event handler (happens when dropping a file on gvim).
        autocmd BufReadPost *
                    \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
                    \   exe "normal g`\"" |
                    \ endif

        " Set syntax highlighting for specific file types
        autocmd BufRead,BufNewFile *.md set filetype=markdown

        " Set spell for markdown files
        autocmd BufRead,BufNewFile *.md setlocal spell
    augroup END

    let g:omni_complete=0

    set wildchar=<Tab> wildmenu wildmode=full
    set complete=.,w,t
    "
    "set wildmenu
    "set wildmode=list:longest
    set wildignore+=.hg,.git,.svn " Version Controls"
    set wildignore+=*.aux,*.out,*.toc "Latex Indermediate files"
    set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg "Binary Imgs"
    set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest "Compiled Object files"
    set wildignore+=*.spl "Compiled speolling world list"
    set wildignore+=*.sw? "Vim swap files"
    set wildignore+=*.DS_Store "OSX SHIT"
    set wildignore+=*.luac "Lua byte code"
    set wildignore+=migrations "Django migrations"
    set wildignore+=*.pyc "Python Object codes"
    set wildignore+=*.orig "Merge resolution files"
" }


" Key (re)mapping {
    "
    let mapleader=','
    set pastetoggle=<F2>

    " Windows like movements for long lines with wrap enabled:
    noremap j gj
    noremap k gk

    " Allow saving of files as sudo when I forget to start vim using sudo.
    cmap w!! :w !sudo tee > /dev/null %

    " Do not leave visual mode after visually shifting text
    vnoremap < <gv
    vnoremap > >gv

    " Tab control
    nmap <Leader>tt :tabnew<cr>
    nmap <Leader>tn :tabnext<cr>
    nmap <Leader>tp :tabprevious<cr>
    nmap <Leader>tc :tabclose<cr>

    noremap <leader>ss :call StripWhitespace()<CR>
" }

" Functions {
"
    " Strip trailing whitespace (<leader>ss)
    function! StripWhitespace()
        let save_cursor = getpos(".")
        let old_query = getreg('/')
        :%s/\s\+$//e
        call setpos('.', save_cursor)
        call setreg('/', old_query)
    endfunction

    if exists("+spelllang")
        set spelllang=en_us
    endif

    set spellfile=~/.vim/spell/en.utf-8.add

    if has('gui_running')
        " Remove toolbar, scrollbar and any noise from GUI
        set guioptions-=T
        set guioptions-=r
        set guioptions-=L
        set guioptions-=m
        set guioptions+=a
        set guifont=Droid\ Sans\ Mono\ 9
        set lines=40
    endif

    if exists('g:omni_complete')
        autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
        autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
        autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
        autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
        autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
        autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc
    endif
" }

" Plugins specific settings {

    " nerdTree {
    if isdirectory(expand("~/.vim/plugged/nerdtree"))
        nnoremap <F9> :NERDTreeToggle<cr>
        let NERDTreeIgnore=['\~$', '\.swp$', '\.git', '\.vim$', '\~$', '\.pyc$']
        autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
    endif
    " }

    " vim-airline {
    if isdirectory(expand("~/.vim/plugged/vim-airline"))
        let g:airline#extensions#tabline#enabled = 1
        " let g:airline_powerline_fonts=1
    endif
    " }


    " syntastic {
    if isdirectory(expand("~/.vim/plugged/syntastic"))
        " To close the error window when using :bdelete command
        nnoremap <silent> <C-d> :lclose<CR>:bdelete<CR>
        cabbrev <silent> bd lclose\|bdelete

        let g:syntastic_python_python_exec = '/usr/bin/python3' " use python3
        let g:syntastic_python_checkers = ['flake8']
        let g:syntastic_javascript_checkers = ['jshint']
        let g:syntastic_ruby_checkers = ['rubocop']
    endif
    " }

    " vim-notes {
    "
    let g:notes_title_sync = 'rename_file'
    " }

    " unite {
    if isdirectory(expand("~/.vim/plugged/unite.vim"))
        let g:unite_kind_file_vertical_preview = 1
        " Use the fuzzy matcher for everything
        call unite#filters#matcher_default#use(['matcher_fuzzy'])
        " Start in insert mode
        let g:unite_enable_start_insert = 1
        " Enable history yank source
        let g:unite_source_history_yank_enable = 1
        " Map space to the prefix for Unite
        nnoremap [unite] <Nop>
        nmap <space> [unite]
        " Quick file search
        nnoremap <silent> [unite]f :<C-u>Unite -buffer-name=files file_rec/async file/new<CR>
        " Quick grep from cwd
        nnoremap <silent> [unite]g :<C-u>Unite -buffer-name=grep grep:.<CR>
        " Quick yank history
        nnoremap <silent> [unite]y :<C-u>Unite -buffer-name=yanks history/yank<CR>
        " Set up some custom ignores
        call unite#custom_source('file_rec,file_rec/async,file_mru,file,buffer,grep',
                    \ 'ignore_pattern', join([
                    \ '\.git/',
                    \ 'git5/.*/review/',
                    \ 'tmp/',
                    \ 'node_modules/',
                    \ 'bower_components/',
                    \ 'dist/',
                    \ '.pyc',
                    \ ], '\|'))
        " Quick line
        nnoremap <silent> [unite]l :<C-u>Unite -buffer-name=search_file line<CR>
        " Quick commands
        nnoremap <silent> [unite]c :<C-u>Unite -buffer-name=commands command<CR>
        " Quick search buffers
        nnoremap <silent> [unite]b :<C-u>Unite -quick-match buffer<CR>
    endif
    " }

    " vim-hdevltools {
    if isdirectory(expand("~/.vim/plugged/vim-hdevtools"))
        au FileType haskell nnoremap <buffer> <Leader>ht :HdevtoolsType<CR>
        au FileType haskell nnoremap <buffer> <silent> <Leader>hc :HdevtoolsClear<CR>
        au FileType haskell nnoremap <buffer> <silent> <Leader>hi :HdevtoolsInfo<CR>
    endif
    " }

    " gundo {
    if isdirectory(expand("~/.vim/plugged/gundo.vim"))
        nnoremap <F5> :GundoToggle<CR>
    endif
    " }

    " vim-airline {
    if isdirectory(expand("~/.vim/plugged/vim-airline"))
        if !exists('g:airline_theme')
        let g:airline_theme = 'solarized'
        endif
        if !exists('g:airline_powerline_fonts')
        " Use the default set of separators with a few customizations
        let g:airline_left_sep='›'  " Slightly fancier than '>'
        let g:airline_right_sep='‹' " Slightly fancier than '<'
        endif
    endif
    " }

    " YouCompleteMe {
    if isdirectory(expand("~/.vim/plugged/YouCompleteMe"))
        " global configuration file for C like languages
        let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
        let g:ycm_filetype_blacklist = {'notes' : 1, 'markdown' : 1, 'text' : 1, 'unite' : 1}
        let g:ycm_autoclose_preview_window_after_completion=1
        let g:ycm_confirm_extra_conf = 0
        let g:ycm_goto_buffer_command='vertical-split'
        " let g:ycm_cache_omnifunc = 1
    endif
    " }

    " MatchTagAlways {
    "
    let g:mta_filetypes = {
        \ 'html' : 1,
        \ 'xhtml' : 1,
        \ 'xml' : 1,
        \ 'jinja' : 1,
        \ 'erb' : 1,
    \}
    " }

    " Tagbar {
    if isdirectory(expand("~/.vim/plugged/tagbar"))
        nmap <leader>tt :TagbarToggle<CR>
    endif
    " }
" }
