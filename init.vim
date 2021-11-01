" Specify a directory for plugins
" - Example: ~/.vim/plugged

if v:progname ==# 'nvim'
  let g:my_vim_dir = expand('~/.config/nvim')
  let g:my_vimrc = g:my_vim_dir . '/init.vim'
else
  let g:my_vim_dir = expand('~/.vim')
  let g:my_vimrc = expand('~/.vimrc')
endif

function! s:source_file(path)
  execute 'source ' . g:my_vim_dir . '/config/'. a:path
endfunction

" if has('nvim')
"   "do something nvim specific here
" endif

call s:source_file('general.vim')
call s:source_file('custom.vim')
let &t_ut=''

call plug#begin(g:my_vim_dir . '/plugged')
call s:source_file('plugins.vim')
call plug#end()

" Loading configuration modules {{{
"
call s:source_file('mappings.vim')
" }}}

colorscheme gruvbox
set background=dark
highlight clear SignColumn
