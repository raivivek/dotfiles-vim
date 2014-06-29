call pathogen#infect()
:Helptags

filetype on 
filetype plugin indent on
filetype plugin on

set encoding=utf-8

" Set syntax if terminal supports colors
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
    set t_Co=256
    syntax on
endif

augroup vimrcEx
  autocmd!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=79

  " When editing a file, always jump to the last known cursor position.
  " Don't do it for commit messages, when the position is invalid, or when
  " inside an event handler (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  " Set syntax highlighting for specific file types
  autocmd BufRead,BufNewFile *.md set filetype=markdown

  " Automatically wrap at 80 characters for Markdown
  autocmd BufRead,BufNewFile *.md setlocal textwidth=80
augroup END

set list listchars=tab:▸\ ,eol:¬         " Invisibles using the Textmate style

set autowrite

colorscheme molokai 

set tabstop=4
set backspace=2
set shiftwidth=4
set softtabstop=4
set expandtab

set showmatch
set smartcase
set smarttab
set showcmd
set incsearch
set wrap

set confirm
set pastetoggle=<F2>
set number
set laststatus=2
set norelativenumber

set timeoutlen=50
set autoread

set novisualbell
set visualbell t_vb=
set ruler

set cindent
set t_RV=

if exists("+spelllang")
  set spelllang=en_us
endif
set spellfile=~/.vim/spell/en.utf-8.add

if has('statusline')
  set laststatus=2
  " Broken down into easily includeable segments
  set statusline=%<%f\    " Filename
  set statusline+=%w%h%m%r " Options
  set statusline+=%{fugitive#statusline()} "  Git Hotness
  set statusline+=\ [%{&ff}/%Y]            " filetype
  set statusline+=\ [%{getcwd()}]          " current dir
  set statusline+=%#warningmsg#
  set statusline+=%{SyntasticStatuslineFlag()}
  set statusline+=%*
  let g:syntastic_enable_signs=1
  set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info
endif

set foldmethod=indent
set foldlevel=99
au VimResized * :wincmd =

au FocusLost * :wa
let mapleader=','
set title


set lazyredraw
set viminfo='20,\"500
set hidden
set history=50
set clipboard=unnamedplus

" Instead of these two options, we can set a single directory for all backups
" and temporary buffers. This is a better solution in case we don't want our
" current buffer to be destroyed due to any IOError.
"
" set backupdir=~/.vimtmp
" set directory=~/.vimtmp
set nobackup
set nowritebackup " Writes the buffer to the same file
set noswapfile

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %

set wildchar=<Tab> wildmenu wildmode=full
set complete=.,w,t

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

nnoremap <F9> :NERDTreeToggle<cr>
let NERDTreeIgnore=['\.vim$', '\~$', '\.pyc$']
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

let g:ctrlp_map = '<c-p>'

let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled = 1

" Fixes issue with strange character appearing in place of space
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"
set tags=./tags;/

" To close the error window when using :bdelete command
" ( For syntastic plugin )
nnoremap <silent> <C-d> :lclose<CR>:bdelete<CR>
cabbrev <silent> bd lclose\|bdelete
let g:syntastic_always_populate_loc_list = 1 "Update location list

" Theme
let g:molokai_original = 1
let g:rehas256 = 1

" Dwm
let g:dwm_map_keys=1

" Vim-notes
let g:notes_directories = ['~/my_coding/Notes']
let g:notes_title_sync = 'rename_file'
