" ============ Set directory paths ==== "{{{
"
" Specify a directory for plugins
if v:progname ==# 'nvim'
  let g:my_vim_dir = expand('~/.config/nvim')
  let g:my_vimrc = g:my_vim_dir . '/init.vim'
else
  let g:my_vim_dir = expand('~/.vim')
  let g:my_vimrc = expand('~/.vimrc')
endif

function! s:source_file(path)
  execute 'source ' . g:my_vim_dir . '/'. a:path
endfunction
"}}}

" ============= Vim-Plug ============== "{{{
"
" Auto-install vim-plug
if empty(glob(g:my_vim_dir . '/autoload/plug.vim'))
  silent !curl -fLo g:my_vim_dir . '/autoload/plug.vim' --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

" Setup plugins
call plug#begin(g:my_vim_dir . '/plugged')
  " Always loaded
  " -------------
  Plug 'nvim-lualine/lualine.nvim' " lua line
  Plug 'tpope/vim-commentary' " Quickly comment and such
  Plug 'windwp/nvim-autopairs' " Auto pair brackets and tags
  Plug 'tpope/vim-sleuth' " Automatically set tabindent etc
  Plug 'Jorengarenar/vim-MvVis' " move visual selection
  Plug 'neoclide/coc.nvim', {'branch': 'release'} " coc completion
  Plug 'tpope/vim-eunuch' " Adds Unix commands
  Plug 'tpope/vim-repeat' " Repeats commands with `.`
  Plug 'tpope/vim-surround' " Surrounds text with characters
  Plug 'simnalamburt/vim-mundo' " Better undo and redo
  Plug 'luochen1990/rainbow' " rainbow parenthesis
  Plug 'gregsexton/MatchTag' " highlight matching html tags
  Plug 'folke/which-key.nvim' " Visualize key-mappings
  Plug 'lewis6991/gitsigns.nvim' " Add git signs in gutter
  Plug 'morhetz/gruvbox' " Gruvbox Theme
  Plug 'dracula/vim' " Dracula Theme
  Plug 'hzchirs/vim-material' " material color themes
  Plug 'psliwka/vim-smoothie' " Smooth scrolling
  Plug 't9md/vim-choosewin' " Choose window

  " Experience++
  " ------------
  Plug 'nvim-lua/plenary.nvim' " Important dependency
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
  Plug 'winston0410/cmd-parser.nvim'
  Plug 'winston0410/range-highlight.nvim'
  Plug 'justinmk/vim-sneak'
  Plug 'github/copilot.vim' " Copilot
  Plug 'rafamadriz/friendly-snippets' " Snippets
  Plug 'ojroques/vim-oscyank'
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  Plug 'nvim-treesitter/nvim-treesitter-textobjects'
  "Plug 'neovim/nvim-lspconfig'
  "Plug 'hrsh7th/nvim-cmp'
  "Plug 'hrsh7th/cmp-nvim-lsp'
  "Plug 'hrsh7th/vim-vsnip'
  "Plug 'hrsh7th/vim-vsnip-integ'

  " Can live without, but really shouldn't
  " --------------------------------------
  Plug 'editorconfig/editorconfig-vim'
  Plug 'kyazdani42/nvim-web-devicons'
  Plug 'FooSoft/vim-argwrap'
  Plug 'raivivek/nextflow-vim', { 'file' : 'nextflow'}
  Plug 'raivivek/vim-snakemake', { 'file' : 'snakemake'}
call plug#end()
" }}}


" ============= Plugins config ============== "{{{
let loaded_netrw = 0                                    " diable netew
let g:omni_sql_no_default_maps = 1                      " disable sql omni completion
let g:loaded_python_provider = 0
let g:loaded_perl_provider = 0
let g:loaded_ruby_provider = 0

call s:source_file('plugins_config.vim')
" }}}


" ====== Options, commands, and editor settings ====== "{{{
"
" General {{{
" -------
set termguicolors

filetype plugin indent on
syntax enable
set mouse=nvi                " Disable mouse in command-line mode
set modeline                 " automatically setting options from modelines
set report=0                 " Don't report on line changes
set hidden                   " hide buffers when abandoned instead of unload
set fileformats=unix,dos,mac " Use Unix as the standard file type
set magic                    " For regular expressions turn magic on
set path=.,**                " Directories to search when using gf
set virtualedit=block        " Position cursor anywhere in visual block
set ttyfast                  " Indicate a fast terminal connection
set formatoptions+=1j        " Don't break lines after a one-letter word
set formatoptions-=t         " Don't auto-wrap text
set guicursor+=n-v-c:blinkon0 " Don't blink cursor in n,v,c mode
" }}}

" Wildmenu {{{
" --------
if has('wildmenu')
  set wildmenu
  set wildchar=<Tab>
  set wildmode=list:longest,full
  set complete=.,w,t
  set wildoptions=tagfile
  set wildignorecase
  set wildignore+=.git,*.pyc,*.spl,*.o,*.out,*.exe,*.dll,*.manifest,*~,#*#,%*
  set wildignore+=*.jpg,*.jpeg,*.png,*.gif,*.zip,**/tmp/**,*.DS_Store
  set wildignore+=.hg,.git,.svn,*.aux,*.out,*.toc,*.orig
endif

" }}}

" Vim Directories {{{
" ---------------
if exists("+spelllang")
    set spelllang=en_us
endif

set undofile noswapfile nobackup nowritebackup
set undodir=$VIMPATH/undo//,$VIMPATH,~/tmp,/var/tmp,/tmp
set nospell spellfile=$VIMPATH/spell/en.utf-8.add
" }}}

" Tabs and Indents {{{
" ----------------
set textwidth=90    " Text width maximum chars before wrapping
set expandtab       " Don't expand tabs to spaces.
set smarttab        " Tab insert blanks according to 'shiftwidth'
set softtabstop=2   " While performing editing operations
set autoindent      " Use same indenting on new lines
set shiftround      " Round indent to multiple of 'shiftwidth'
set shiftwidth=2    " Number of spaces to use in auto(indent)
set joinspaces
set autowrite
set emoji
set autoread
" }}}

" Performance Tweaks {{{"
" ----------------
set nocursorline
set nocursorcolumn
set scrolljump=5
set lazyredraw
set redrawtime=10000
set synmaxcol=180
set re=1
" }}}

" Searching {{{
" ---------
set ignorecase      " Search ignoring case
set smartcase       " Keep case when searching with *
set infercase
set incsearch       " Incremental search
set hlsearch        " Highlight search results
set wrapscan        " Searches wrap around the end of the file
set showmatch       " Jump to matching bracket
set matchpairs+=<:> " Add HTML brackets to pair matching
set matchtime=1     " Tenths of a second to show the matching paren
set cpoptions-=m    " showmatch will wait 0.5s or until a char is typed
" }}}

" Behavior {{{
" --------
set nostartofline               " Cursor in same column for few commands
set whichwrap+=h,l,<,>,[,],~    " Move to following line on certain keys
set splitbelow splitright       " Splits open bottom right
set switchbuf=usetab,split      " Switch buffer behavior
set backspace=indent,eol,start  " Intuitive backspacing in insert mode
set diffopt=filler,iwhite       " Diff mode: show fillers, ignore whitespace
set complete=.                  " No wins, buffs, tags, include scanning
set nowrap                      " No wrap by default
" }}}

" Editor UI Appearance {{{
" --------------------
set noshowmode " Don't show mode in cmd window
set noshowcmd " Don't show command in status line
set shortmess=caIfilmnrxoOtT " Shorten messages and don't show intro
set cmdheight=1
set updatetime=300
set number " Show line numbers
set list " Show hidden characters
set winwidth=30 " Minimum width for current window
set winheight=1 " Minimum height for current window
"set previewheight=8     " Completion preview height
"set helpheight=12       " Minimum help window height
set display=lastline
set cmdwinheight=5 " Command-line lines
set laststatus=2 " Always show a status line
set signcolumn=yes " Show sign column
set concealcursor=niv
" }}}

" Functions {{{
" --------
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<C-R>
endif

" Change directory to current file path
if !exists('g:no_autochdir')
  autocmd BufEnter * if bufname("") !~ "^\[A-Za-z0-9\]*://" | lcd %:p:h | endif
endif

" Autosave silently on lost focus
au FocusLost * silent! wa

" Remove end of line whitespace.
command! -range=% WhitespaceErase call <SID>WhitespaceErase(<line1>,<line2>)
function! s:WhitespaceErase(line1, line2)
  let l:save_cursor = getpos('.')
  silent! execute ':'.a:line1.','.a:line2.'s/\s\+$//'
  call setpos('.', l:save_cursor)
endfunction
" }}}

" Theme {{{
" -----
colorscheme dracula
set background=dark
hi clear SignColumn
hi Comment gui=italic cterm=italic
" }}}
"}}}
