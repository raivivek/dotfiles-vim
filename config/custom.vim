" Change directory to current file path
if !exists('g:no_autochdir')
  autocmd BufEnter * if bufname("") !~ "^\[A-Za-z0-9\]*://" | lcd %:p:h | endif
endif

" Autosave silently on lost focus
au FocusLost * silent! wa

" Remove end of line white space.
command! -range=% WhitespaceErase call <SID>WhitespaceErase(<line1>,<line2>)
function! s:WhitespaceErase(line1, line2) "{{{
  let l:save_cursor = getpos('.')
  silent! execute ':'.a:line1.','.a:line2.'s/\s\+$//'
  call setpos('.', l:save_cursor)
endfunction "}}}
