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
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_python_exec = '~/.anaconda3/bin/python3'
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_ruby_checkers = ['rubocop']
" }}}

" GundoTree {{{
nnoremap <Leader>gu :GundoToggle<CR>
" }}}

" Goyo {{{
nnoremap <Leader>G :Goyo<CR>
" }}}

" Vim Thesaurus {{{
nmap <Leader>tf :OnlineThesaurusCurrentWord<CR>
nmap <Leader>ts :OnlineThesaurusLookup
" }}}

" YouCompleteMe {{{
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
" let g:ycm_filetype_blacklist = {'markdown' : 1, 'text' : 1, 'unite' : 1}
let g:ycm_python_binary_path='/home/vivekrai/.anaconda3/bin/python3'
let g:ycm_error_symbol = '>'
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_confirm_extra_conf = 0
let g:ycm_goto_buffer_command='vertical-split'
let g:ycm_cache_omnifunc = 1
" }}}

" ChooseWin {{{
nmap - <Plug>(choosewin)

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

" Vim Session {{{
nmap <Leader>ss :<C-u>SaveSession<CR>
nmap <Leader>so :<C-u>OpenSession last<CR>

let g:session_directory = $VARPATH.'/session'
let g:session_default_name = 'last'
let g:session_default_overwrite = 1
let g:session_verbose_messages = 0
let g:session_autosave = 'no'
let g:session_autoload = 'no'
let g:session_persist_colors = 0
let g:session_menu = 0
" }}}

" Vim-Cursorword {{{
augroup cursorword-filetype
  autocmd!
  autocmd FileType qf,vimfiler,vimshell,thumbnail,vimcalc,quickrun,github-dashboard
        \ let b:cursorword = 0
augroup END
" }}}

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

augroup litecorrect
  autocmd!
  autocmd FileType markdown,mkd call litecorrect#init()
  autocmd FileType textile call litecorrect#init()
augroup END

" Ditto {{{
" paragraph, file, sentence
let g:ditto_mode = 'paragraph'
let g:ditto_dir = '$VARPATH/Ditto'
" }}}

" NerdCommenter {{{
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDTrimTrailingWhitespace = 1
let g:NERDDefaultAlign = 'left'
" }}}

" FZF, FZF.vim {{{
let g:fzf_history_dir = '~/.fzf-history'
let g:fzf_buffers_jump = 1
let g:fzf_layout = { 'down': '~20%' }
let g:fzf_colors =
\ { 'fg':      ['Normal'],
  \ 'bg':      ['Normal'],
  \ 'hl':      ['Comment'],
  \ 'fg+':     ['CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['CursorLine', 'CursorColumn'],
  \ 'hl+':     ['Statement'],
  \ 'info':    ['PreProc'],
  \ 'prompt':  ['Conditional'],
  \ 'pointer': ['Exception'],
  \ 'marker':  ['Keyword'],
  \ 'spinner': ['Label'],
  \ 'header':  ['Comment'] }
nmap <leader>F :FZF<CR>
nmap <leader>ff :Files ~<CR>
nmap <leader>fb :Buffers<CR>
nmap <leader>fl :BLines<CR>
" }}}
"

" AutoPairs {{{
" let g:AutoPairsFlyMode = 1
" let g:AutoPairsShortcutBackInsert = '<M-b>'
" }}}

" Accelerated JK {{{
nmap j <Plug>(accelerated_jk_gj)
nmap k <Plug>(accelerated_jk_gk)
let g:accelerated_jk_enable_deceleration = 1
" }}}
" vim: set ts=2 sw=2 tw=80 noet :
