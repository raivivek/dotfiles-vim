" Plugin Specific Settings
"---------------------------------------------------------

" General {{{
let g:airline#extensions#tabline#enabled = 1
let g:airline_left_sep=' '
let g:airline_right_sep=' '
" }}}

" {{{
nnoremap <silent> <C-d> :lclose<CR>:bdelete<CR>
cabbrev <silent> bd lclose\|bdelete

let g:syntastic_python_python_exec = '/usr/bin/python3'
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_ruby_checkers = ['rubocop']
" }}}
"
nnoremap <Leader>gu :GundoToggle<CR>
nnoremap <Leader>G :Goyo<CR>

let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
"let g:ycm_filetype_blacklist = {'markdown' : 1, 'text' : 1, 'unite' : 1}
let g:ycm_error_symbol = '>'
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_confirm_extra_conf = 0
let g:ycm_goto_buffer_command='vertical-split'
let g:ycm_cache_omnifunc = 1

" Vim Directories {{{
nmap -         <Plug>(choosewin)
nmap <Leader>- :<C-u>ChooseWinSwap<CR>

let g:choosewin_label = 'FGHJKLZXCVBNM'
let g:choosewin_overlay_enable     = 1
let g:choosewin_statusline_replace = 1
let g:choosewin_tabline_replace    = 1
let g:choosewin_label_padding      = 3
let g:choosewin_blink_on_land      = 0

let g:choosewin_color_label = {
      \ 'cterm': [ 236, 2 ], 'gui': [ '#555555', '#000000' ] }
let g:choosewin_color_label_current = {
      \ 'cterm': [ 234, 220 ], 'gui': [ '#333333', '#000000' ] }
let g:choosewin_color_other = {
      \ 'cterm': [ 235, 235 ], 'gui': [ '#333333' ] }
let g:choosewin_color_overlay = {
      \ 'cterm': [ 2, 10 ], 'gui': [ '#88A2A4' ] }
let g:choosewin_color_overlay_current = {
      \ 'cterm': [ 72, 64 ], 'gui': [ '#7BB292' ] }
" }}}

nmap <Leader>se :<C-u>SaveSession<CR>
nmap <Leader>os :<C-u>OpenSession last<CR>

map <leader>e :NERDTreeToggle<CR>
map <leader>f :NERDTreeFind<CR>

let g:NERDShutUp=1
let NERDTreeShowBookmarks=1
let NERDTreeIgnore=['\.py[cd]$', '\~$', '\.swo$', '\.swp$', '^\.git$', '^\.hg$', '^\.svn$', '\.bzr$']
let NERDTreeChDirMode=1
let NERDTreeQuitOnOpen=1
let NERDTreeMouseMode=2
let NERDTreeRespectWildIgnore=1
let NERDTreeKeepTreeInNewTab=1
let g:nerdtree_tabs_open_on_gui_startup=1

let g:session_directory = $VARPATH.'/session'
let g:session_default_name = 'last'
let g:session_default_overwrite = 1
let g:session_verbose_messages = 0
let g:session_autosave = 'no'
let g:session_autoload = 'no'
let g:session_persist_colors = 0
let g:session_menu = 0

augroup cursorword-filetype
  autocmd!
  autocmd FileType qf,vimfiler,vimshell,thumbnail,vimcalc,quickrun,github-dashboard
        \ let b:cursorword = 0
augroup END

augroup textobj_quote
  autocmd!
  autocmd FileType markdown call textobj#quote#init()
  autocmd FileType textile call textobj#quote#init()
  autocmd FileType text call textobj#quote#init({'educate': 0})
augroup END

augroup textobj_sentence
  autocmd!
  autocmd FileType markdown call textobj#sentence#init()
  autocmd FileType textile call textobj#sentence#init()
  autocmd FileType text call textobj#sentence#init()
augroup END

" vim: set ts=2 sw=2 tw=80 noet :
