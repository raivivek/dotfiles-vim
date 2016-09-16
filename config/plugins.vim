" Essential plugins, always loaded {{{
Plug 'bling/vim-airline'
Plug 'bling/vim-airline-themes'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-fugitive'
Plug 'tomtom/quickfixsigns_vim'
Plug 'Shougo/vimproc.vim', {'do': 'make', 'frozen': 'true'}
Plug 'docunext/closetag.vim'
Plug 'tpope/vim-surround'
Plug 'itchyny/vim-cursorword'
Plug 'tpope/vim-repeat'
Plug 'SirVer/ultisnips'
Plug 'saaguero/vim-textobj-pastedtext'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --all', 'frozen': 'true' }
Plug 'xolox/vim-misc'
Plug 'xolox/vim-session'
Plug 'zenbro/mirror.vim'
Plug 'airblade/vim-gitgutter'
Plug 'jiangmiao/auto-pairs'
Plug 'sjl/gundo.vim'
Plug 'junegunn/goyo.vim'
" }}}
"
" Essential, navigation {{{
Plug 't9md/vim-choosewin'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'rhysd/accelerated-jk'
" }}}

" File type specific plugins {{{
Plug 'othree/html5.vim', {'for': 'html'}
Plug 'jelera/vim-javascript-syntax', {'for': 'javascript'}
Plug 'jiangmiao/simple-javascript-indenter', {'for': 'javascript'}
Plug 'mitsuhiko/vim-jinja', {'for': ['htmljinja', 'jinja']}
Plug 'groenewege/vim-less', {'for': 'less'}
Plug 'tpope/vim-haml', {'for': 'haml'}
Plug 'hail2u/vim-css3-syntax', {'for': 'css'}
Plug 'chrisbra/csv.vim', {'for': 'csv'}
Plug 'fs111/pydoc.vim', {'for': 'python'}
Plug 'elzr/vim-json', {'for': 'json'}
Plug 'vim-ruby/vim-ruby', {'for': 'ruby'}
Plug 'tpope/vim-endwise', {'for': 'ruby'}
Plug 'lervag/vimtex', {'for': ['plaintex', 'tex', 'latex', 'bib']}
Plug 'Valloric/MatchTagAlways', {'for': ['html', 'erb']}
" }}}

" On-demand loading plugins {{{
Plug 'nathanaelkane/vim-indent-guides'
Plug 'beloglazov/vim-online-thesaurus', { 'on': ['OnlineThesaurusCurrentWord', 'Thesaurus']}
" }}}
"
" Writing and Text-Objects plugins {{{
Plug 'kana/vim-textobj-user'
Plug 'reedes/vim-textobj-quote', {'for': ['text', 'markdown']}
Plug 'reedes/vim-textobj-sentence', {'for': ['text', 'markdown']}
Plug 'reedes/vim-litecorrect', {'for': ['text', 'markdown']}
Plug 'reedes/vim-wordy', {'for': ['text', 'markdown']}
Plug 'reedes/vim-pencil', {'for': ['text', 'markdown']}
Plug 'reedes/vim-lexical', {'for': ['text', 'markdown']}
Plug 'dbmrq/vim-ditto', {'for': ['text', 'markdown']}
" }}}

" Themes {{{
Plug 'reedes/vim-colors-pencil'
Plug 'tomasr/molokai'
Plug 'nanotech/jellybeans.vim'
Plug 'altercation/vim-colors-solarized'
Plug 'w0ng/vim-hybrid'
Plug 'gilgigilgil/anderson.vim'
Plug 'romainl/flattened'
Plug 'chriskempson/base16-vim'
" }}}
