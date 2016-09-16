" General Settings
"---------------------------------------------------------
" General {{{
set mouse=nvi                " Disable mouse in command-line mode
set modeline                 " automatically setting options from modelines
set report=0                 " Don't report on line changes
set t_vb=
set lazyredraw               " don't redraw while in macros
set hidden                   " hide buffers when abandoned instead of unload
set fileformats=unix,dos,mac " Use Unix as the standard file type
set magic                    " For regular expressions turn magic on
set path=.,**                " Directories to search when using gf
set virtualedit=block        " Position cursor anywhere in visual block
set history=500              " Search and commands remembered
set synmaxcol=1000           " Don't syntax highlight long lines
syntax sync minlines=256     " Update syntax highlighting for more lines
set ttyfast                  " Indicate a fast terminal connection
set formatoptions+=1         " Don't break lines after a one-letter word
set formatoptions-=t         " Don't auto-wrap text
set formatoptions+=j         " Remove comment leader when joining lines
set guicursor+=n-v-c:blinkon0 " Don't blink cursor in n,v,c mode
set antialias

if has('vim_starting')
  set encoding=utf-8
  scriptencoding utf-8
endif

" What to save for views:
set viewoptions-=options viewoptions+=slash,unix

" What not to save in sessions:
set sessionoptions-=options
set sessionoptions-=globals
set sessionoptions-=folds
set sessionoptions-=help
set sessionoptions-=buffers

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
set undodir=$VARPATH/undo//,$VARPATH,~/tmp,/var/tmp,/tmp
set nospell spellfile=$VIMPATH/spell/en.utf-8.add

" }}}
" Tabs and Indents {{{
" ----------------
set textwidth=80    " Text width maximum chars before wrapping
set expandtab       " Don't expand tabs to spaces.
set smarttab        " Tab insert blanks according to 'shiftwidth'
set softtabstop=2   " While performing editing operations
set autoindent      " Use same indenting on new lines
set smartindent     " Smart autoindenting on new lines
set shiftround      " Round indent to multiple of 'shiftwidth'
set shiftwidth=2    " Number of spaces to use in auto(indent)
set nojoinspaces
set autowrite
set autoread

" }}}
" Folds {{{
" -----
if has('folding')
  set foldenable
  set foldmethod=syntax
  set foldlevelstart=99
  set foldtext=FoldText()
endif

" }}}
" Time {{{
" --------
set timeout ttimeout
set timeoutlen=750  " Time out on mappings
set ttimeoutlen=250 " Time out on key codes
set updatetime=1000 " Idle time to write swap

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
set linebreak                   " Break long lines at 'breakat'
set breakat=\ \ ;:,!?           " Long lines break chars
set nostartofline               " Cursor in same column for few commands
set whichwrap+=h,l,<,>,[,],~    " Move to following line on certain keys
set splitbelow splitright       " Splits open bottom right
set switchbuf=usetab,split      " Switch buffer behavior
set backspace=indent,eol,start  " Intuitive backspacing in insert mode
set diffopt=filler,iwhite       " Diff mode: show fillers, ignore white
set showfulltag                 " Show tag and tidy search in completion
set completeopt=menuone         " Show menu even for one item
set complete=.                  " No wins, buffs, tags, include scanning
set nowrap                      " No wrap by default

" }}}
" Editor UI Appearance {{{
" --------------------
set noshowmode          " Don't show mode in cmd window
set shortmess=caIfilmnrxoOtT   " Shorten messages and don't show intro
set scrolloff=2         " Keep at least 2 lines above/below
set sidescrolloff=2     " Keep at least 2 lines left/right
set pumheight=20        " Pop-up menu's line height
set number              " Show line numbers
" set relativenumber      " Use relative instead of absolute line numbers
set noruler             " Disable default status ruler
set list                " Show hidden characters
set listchars=tab:▸\ ,trail:·


set showtabline=2       " Always show the tabs line
set tabpagemax=30       " Maximum number of tab pages
set winwidth=30         " Minimum width for current window
set winheight=1         " Minimum height for current window
set previewheight=8     " Completion preview height
set helpheight=12       " Minimum help window height

set display=lastline
set notitle             " No need for a title
set noshowcmd           " Don't show command in status line
set cmdheight=2         " Height of the command line
set cmdwinheight=5      " Command-line lines
" set noequalalways     " Don't resize windows on split or close
set laststatus=2        " Always show a status line
set colorcolumn=80      " Highlight the 80th character limit

highlight clear SignColumn
highlight clear LineNr

" For snippet_complete marker
if has('conceal') && v:version >= 703
  set conceallevel=2 concealcursor=niv
endif

if has('gui_running')
  " Remove toolbar, scrollbar and any noise from GUI
  set guioptions-=T
  set guioptions-=r
  set guioptions-=L
  set guioptions-=m
  set guioptions+=a
  set guifont=Source\ Code\ Pro\ Medium\ 10
  set lines=40
endif

" vim: set ts=2 sw=2 tw=80 noet :
