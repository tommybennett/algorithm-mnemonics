" Vim global plugin for C++ utility functions 
" Maintainer: Tommy Bennett	tab@ejallen.com
" License: This file is placed in the public domain.

if exists("g:loaded_cpputil")
  finish
endif
let g:loaded_cpputil = 1

function Cpp_Camel2Underscore( word )
  let result = ""
  let start = 0
  while start > -1 
    let nextword = matchstr( a:word, "[A-Z][^A-Z]*", start )
    if strlen(result)
      let result = result . "_"
    endif
    let result = result . nextword
    let start = match( a:word, "[A-Z]", start + 1 )
  endwhile
  return tolower( result )
endfunction

function Cpp_GotoLastLine()
  normal gg
  if search("^namespace")
    normal G
    call search("^}", "b")
  else
    normal G
  endif 
endfunction


