if &compatible
  set nocompatible
endif

" Respect XDG
if isdirectory($XDG_CONFIG_HOME.'/vim')
  let $VIMPATH=expand('$XDG_CONFIG_HOME/vim')
  let $VARPATH=expand('$XDG_CACHE_HOME/vim')
else
  let $VIMPATH=expand('$HOME/.vim')
  let $VARPATH=expand('$HOME/.cache/vim')
endif

function! s:source_file(path)
  execute 'source' fnameescape($VIMPATH.'/config/'.a:path)
endfunction

" Initialize vim-plug
call plug#begin('$VIMPATH/plugins')
call s:source_file('plugins.vim')             
call plug#end()                               
                                              
" Loading configuration modules {{{           
call s:source_file('init.vim')                
call s:source_file('bindings.vim')            
call s:source_file('general.vim')             
call s:source_file('custom.vim')
call s:source_file('theme.vim')

set secure
