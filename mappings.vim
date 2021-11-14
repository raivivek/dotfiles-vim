let mapleader=","

" Telescope {{{
" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope git_files<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>fr <cmd>Telescope live_grep<cr>
" }}}

" General {{{
" Window prefix
nnoremap  [Window]   <Nop>
nmap      s [Window]

" Start an external command with a single bang
nnoremap ! :!

" Allow misspellings when :wq
cabbrev Wq :wq
cabbrev qw :wq
cabbrev Qa :qa

" When pressing <leader>cd switch to the directory of the open buffer
map <Leader>cd :cd %:p:h<CR>:pwd<CR>

" Fast saving
nnoremap <Leader>w :w<CR>
vnoremap <Leader>w <Esc>:w<CR>
nnoremap <C-s> :<C-u>w<CR>
vnoremap <C-s> :<C-u>w<CR>
cnoremap <C-s> <C-u>w<CR>

" https://github.com/Shougo/shougo-s-github
nnoremap <silent> [Window]p  :<C-u>call <SID>split_nicely()<CR>
nnoremap <silent> [Window]v  :<C-u>split<CR>
nnoremap <silent> [Window]g  :<C-u>vsplit<CR>
nnoremap <silent> [Window]t  :enew<CR>
nnoremap <silent> [Window]o  :<C-u>only<CR>
nnoremap <silent> [Window]D  :<C-u>call <SID>CustomBufferDelete()<CR>
nnoremap <silent> [Window]x  :<C-u>call <SID>CustomBufferDeleteNew()<CR>
nnoremap <silent> [Window]q  :close<CR>
nnoremap <silent> [Window]Q  :bdelete<CR>
nnoremap <silent> [Window]\  :b#<CR>
nnoremap <silent> [Window]c :<C-u>call <SID>smart_close()<CR>

nnoremap <silent> <Tab> :BufferNext<CR>
nnoremap <silent> <S-Tab> :BufferPrev<CR>

" Split current buffer, go to previous window and previous buffer
nnoremap <Leader>sv :split<CR>:wincmd p<CR>:e#<CR>
nnoremap <Leader>sg :vsplit<CR>:wincmd p<CR>:e#<CR>

function! s:smart_close() "
  if winnr('$') != 1
    close
  else
    call s:alternate_buffer()
  endif
endfunction "}}}

function! s:split_nicely() "
  if winwidth(0) > 2 * &winwidth
    vsplit
  else
    split
  endif
  wincmd p
endfunction "}}}

function! s:CustomBufferDelete() "
  let l:current = bufnr('%')
  call s:alternate_buffer()
  silent! execute 'bdelete '.l:current
endfunction "}}}

function! s:CustomBufferDeleteNew() "
  let l:current = bufnr('%')
  if getbufvar(l:current, '&modified')
    return
  endif
  enew
  silent! execute 'bdelete '.l:current
endfunction "}}}

function! s:alternate_buffer() "
  let l:listed_buffer_len = len(filter(range(1, bufnr('$')),
        \ 's:buflisted(v:val) && getbufvar(v:val, "&filetype") !=# "unite"'))
  if l:listed_buffer_len <= 1
    enew
    return
  endif

  let cnt = 0
  let pos = 1
  let current = 0
  while pos <= bufnr('$')
    if s:buflisted(pos)
      if pos == bufnr('%')
        let current = cnt
      endif

      let cnt += 1
    endif

    let pos += 1
  endwhile

  if current > cnt / 2
    bprevious
  else
    bnext
  endif
endfunction "}}}

function! s:buflisted(bufnr) "
  return exists('t:unite_buffer_dictionary') ?
        \ has_key(t:unite_buffer_dictionary, a:bufnr) && buflisted(a:bufnr) :
        \ buflisted(a:bufnr)
endfunction

" Select last paste
nnoremap <expr> gp '`['.strpart(getregtype(), 0, 1).'`]'

" Disable EX mode
nnoremap  Q <Nop>
nnoremap gQ <Nop>

" Select blocks after indenting
xnoremap < <gv
xnoremap > >gv|

" Use tab for indenting in visual mode
vnoremap <Tab> >gv|
vnoremap <S-Tab> <gv
nnoremap > >>_
nnoremap < <<_
"}}}

" vim-sneak  {{{
let g:sneak#label = 1
" }}}

" GundoTree  {{{
nnoremap <Leader>gu :GundoToggle<CR>
" }}}

" Coc {{{
nnoremap <leader>co <cmd>CocAction<cr>
vnoremap <leader>co <cmd>CocAction<cr>

" Navigate snippet placeholders using tab
let g:coc_snippet_next = '<Tab>'
let g:coc_snippet_prev = '<S-Tab>'

" list of the extensions to make sure are always installed
let g:coc_global_extensions = [
            \'coc-yank',
            \'coc-json',
            \'coc-css',
            \'coc-html',
            \'coc-yaml',
            \'coc-lists',
            \'coc-snippets',
            \'coc-pyright',
            \'coc-clangd',
            \'coc-xml',
            \'coc-syntax',
            \'coc-highlight',
            \'coc-sh',
            \]

" check if last inserted char is a backspace (used by coc pmenu)
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" show docs on things with K
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" use tab to navigate snippet placeholders
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump', ''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" Use enter to accept snippet expansion
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<CR>"

" coc completion popup
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

" format with available file format formatter
command! -nargs=0 Format :call CocAction('format')

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f <Plug>(coc-format-selected)
nmap <leader>f <Plug>(coc-format-selected)
" }}}

" ChooseWin  {{{
nmap  -  <Plug>(choosewin)
" }}}

" OSC Yank  {{{
vnoremap <leader>c :OSCYank<CR>
nmap <leader>o <Plug>OSCYank
" }}}
