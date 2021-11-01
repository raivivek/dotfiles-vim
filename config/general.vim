" General Settings
"---------------------------------------------------------
" Vim-sensible {{{
if has('autocmd')
  filetype plugin indent on
endif

if has('syntax') && !exists('g:syntax_on')
  syntax enable
endif

if !has('nvim') && &ttimeoutlen == -1
  set ttimeout
  set ttimeoutlen=100
endif

" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
endif

if !&scrolloff
  set scrolloff=1
endif
if !&sidescrolloff
  set sidescrolloff=5
endif

if &listchars ==# 'eol:$'
  set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
endif

if !has('gui_running')
  set t_Co=256
endif
" }}}

" General {{{
set termguicolors

set mouse=nvi                " Disable mouse in command-line mode
set modeline                 " automatically setting options from modelines
set report=0                 " Don't report on line changes
set hidden                   " hide buffers when abandoned instead of unload
set fileformats=unix,dos,mac " Use Unix as the standard file type
set magic                    " For regular expressions turn magic on
set path=.,**                " Directories to search when using gf
set virtualedit=block        " Position cursor anywhere in visual block
set ttyfast                  " Indicate a fast terminal connection
set formatoptions+=1         " Don't break lines after a one-letter word
set formatoptions-=t         " Don't auto-wrap text
set formatoptions+=j         " Remove comment leader when joining lines
set guicursor+=n-v-c:blinkon0 " Don't blink cursor in n,v,c mode

if has('clipboard') || has('gui_running')
  " Do not do anything with system's clipboard
  set clipboard=
endif

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
set autoread

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
set diffopt=filler,iwhite       " Diff mode: show fillers, ignore white
set showfulltag                 " Show tag and tidy search in completion
set complete=.                  " No wins, buffs, tags, include scanning
set nowrap                      " No wrap by default

" }}}

" Editor UI Appearance {{{
" --------------------
set noshowmode          " Don't show mode in cmd window
set shortmess=caIfilmnrxoOtT   " Shorten messages and don't show intro
set pumheight=20        " Pop-up menu's line height
set number              " Show line numbers
set list                " Show hidden characters


set tabpagemax=50       " Maximum number of tab pages
set winwidth=30         " Minimum width for current window
set winheight=1         " Minimum height for current window
set previewheight=8     " Completion preview height
set helpheight=12       " Minimum help window height

set display=lastline
set noshowcmd           " Don't show command in status line
set cmdheight=2         " Height of the command line
set cmdwinheight=5      " Command-line lines
set laststatus=2        " Always show a status line
set colorcolumn=100     " Highlight the 80th character limit
set signcolumn=yes

set conceallevel=2 concealcursor=niv

" vim: set ts=2 sw=2 tw=80 noet :
