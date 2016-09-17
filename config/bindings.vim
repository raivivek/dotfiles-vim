" Window prefix
nnoremap  [Window]   <Nop>
nmap      s [Window]

let mapleader=','

" do not use clipboard=unnamed, yank and paste from X11's clipboard.
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

" Copy text to the end-of-line
nnoremap Y y$

" Start an external command with a single bang
nnoremap ! :!

" Allow misspellings when :wq
cabbrev Wq :wq
cabbrev qw :wq
cabbrev Qa :qa

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

" --------------- {{{
" When pressing <leader>cd switch to the directory of the open buffer
map <Leader>cd :cd %:p:h<CR>:pwd<CR>

" Fast saving
nnoremap <Leader>w :w<CR>
vnoremap <Leader>w <Esc>:w<CR>
nnoremap <C-s> :<C-u>w<CR>
vnoremap <C-s> :<C-u>w<CR>
cnoremap <C-s> <C-u>w<CR>

cmap W!! w !sudo tee % >/dev/null
" }}}


" Credits: https://github.com/Shougo/shougo-s-github {{{
nnoremap <silent> [Window]p  :<C-u>call <SID>split_nicely()<CR>
nnoremap <silent> [Window]v  :<C-u>split<CR>
nnoremap <silent> [Window]g  :<C-u>vsplit<CR>
nnoremap <silent> [Window]t  :tabnew<CR>
nnoremap <silent> [Window]o  :<C-u>only<CR>
nnoremap <silent> [Window]D  :<C-u>call <SID>CustomBufferDelete()<CR>
nnoremap <silent> [Window]x  :<C-u>call <SID>CustomBufferDeleteNew()<CR>
nnoremap <silent> [Window]\  :b#<CR>
nnoremap <silent> [Window]q  :close<CR>
nnoremap <silent> [Window]Q  :bdelete<CR>
nnoremap <silent> [Window]c :<C-u>call <SID>smart_close()<CR>

" Move around windows beyond tabs
nnoremap <silent> <Tab> :call <SID>NextWindowOrTab()<CR>
nnoremap <silent> <S-Tab> :call <SID>PreviousWindowOrTab()<CR>

" Split current buffer, go to previous window and previous buffer
nnoremap <Leader>sv :split<CR>:wincmd p<CR>:e#<CR>
nnoremap <Leader>sg :vsplit<CR>:wincmd p<CR>:e#<CR>

function! s:smart_close() "{{{
  if winnr('$') != 1
    close
  else
    call s:alternate_buffer()
  endif
endfunction "}}}

function! s:NextWindow() "{{{
  if winnr('$') == 1
    silent! normal! ``z.
  else
    wincmd w
  endif
endfunction "}}}

function! s:NextWindowOrTab() "{{{
  if winnr() < winnr('$')
    wincmd w
  else
    tabnext
    1wincmd w
  endif
endfunction "}}}

function! s:PreviousWindowOrTab() "{{{
  if winnr() > 1
    wincmd W
  else
    tabprevious
    execute winnr('$') . 'wincmd w'
  endif
endfunction "}}}

function! s:split_nicely() "{{{
  if winwidth(0) > 2 * &winwidth
    vsplit
  else
    split
  endif
  wincmd p
endfunction "}}}

function! s:CustomBufferDelete() "{{{
  let l:current = bufnr('%')
  call s:alternate_buffer()
  silent! execute 'bdelete '.l:current
endfunction "}}}

function! s:CustomBufferDeleteNew() "{{{
  let l:current = bufnr('%')
  if getbufvar(l:current, '&modified')
    return
  endif
  enew
  silent! execute 'bdelete '.l:current
endfunction "}}}

function! s:alternate_buffer() "{{{
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

function! s:buflisted(bufnr) "{{{
  return exists('t:unite_buffer_dictionary') ?
        \ has_key(t:unite_buffer_dictionary, a:bufnr) && buflisted(a:bufnr) :
        \ buflisted(a:bufnr)
endfunction
"}}}
