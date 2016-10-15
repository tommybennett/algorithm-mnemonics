" Vim global plugin for C++ algorithms 
" Maintainer: Tommy Bennett tommy_bennett@icloud.com	
" License: This file is placed in the public domain.

if exists("g:loaded_cppalgo")
  finish
endif
let g:loaded_cppalgo = 1

" Helper to delete character if it is 'empty space'
function Eatchar()
  let c = nr2char(getchar())
  return (c =~ '\s') ? '' : c
endfunction

" Replace abbreviation if we're not in comment or other unwanted places
function MapNoContext(key, seq)
  let syn = synIDattr(synID(line('.'),col('.')-1,1),'name')
  if syn =~? 'comment\|string\|character\|doxygen'
    return a:key
  else
    exe 'return "' .
      \ substitute( a:seq, '\\<\(.\{-}\)\\>', '"."\\<\1>"."', 'g' ) . '"'
  endif
endfunction

" Create abbreviation suitable for MapNoContext
function Iab(ab, full)
  exe "iab ".a:ab." <C-R>=MapNoContext('".
    \ a:ab."', '".escape (a:full.'<C-R>=Eatchar()<CR>', '<>\"').
    \"')<CR>"
endfunction

function Cpp_BeginEnd( func )
  execute "normal! b\"udwi  \<esc>"
  let @f = a:func
  execute "normal! iauto pos = \<esc>\"fpa(begin(\<esc>\"upa), end(\<esc>\"upa));\<esc>"
  execute "normal! oif (pos != end(\<esc>\"upa)) {\<cr>}\<esc>"
  execute "normal! k"
endfunction

function Cpp_BeginEndNoIf( func, return_variable )
  execute "normal! b\"udwi  \<esc>"
  let @f = a:func
  let @v = a:return_variable
  execute "normal! iauto \<esc>\"vpa = \<esc>\"fpa(begin(\<esc>\"upa), end(\<esc>\"upa));\<esc>"
  execute "normal! 0w"
endfunction

function Cpp_BeginEndNoReturn( func )
  execute "normal! b\"udwi  \<esc>"
  let @f = a:func
  execute "normal! i\<esc>\"fpa(begin(\<esc>\"upa), end(\<esc>\"upa));\<esc>"
  execute "normal! 0w"
endfunction

function Cpp_BeginEndUnary( func )
  execute "normal! b\"udwi  \<esc>"
  let @f = a:func
  execute "normal! i\<esc>\"fpa(begin(\<esc>\"upa), end(\<esc>\"upa), "
  execute "normal! i []() {\<cr>});\<esc>04x"
  execute "normal! kf#x"
endfunction

function Cpp_BeginEndUnaryNoReturn( func )
  execute "normal! b\<esc>\"udwi  \<esc>"
  let @f = a:func
  execute "normal! i\<esc>\"fpa(begin(\<esc>\"upa), end(\<esc>\"upa), "
  execute "normal! i [](#) {\<cr>"
  execute "normal! i  });\<esc>kf#x"
endfunction

function Cpp_BeginEndUnaryNoIf( func, value )
  execute "normal! b\"udwi  \<esc>"
  let @f = a:func
  let @v = a:value
  execute "normal! iauto \<esc>\"vpa = \<esc>\"fpa(begin(\<esc>\"upa), end(\<esc>\"upa), "
  execute "normal! i [](#) {\<cr>"
  execute "normal! i  });\<esc>kf#x"
endfunction

function Cpp_IfBeginEnd( func )
  execute "normal! b\"udwi  \<esc>"
  let @f = a:func
  execute "normal! iif (\<esc>\"fpa(begin(\<esc>\"upa), end(\<esc>\"upa))) {\<cr>}"
  execute "normal! k"
endfunction

function Cpp_IfBeginEndUnary( func )
  execute "normal! b\"udwi  \<esc>"
  let @f = a:func
  execute "normal! iif (\<esc>\"fpa(begin(\<esc>\"upa), end(\<esc>\"upa), "
  execute "normal! i [](#) {\<cr>"
  execute "normal! i  }) ) {\<cr>}\<esc>2kf#x"
endfunction

function Cpp_BeginEndValue( func )
  execute "normal! b\"udwi  \<esc>"
  let @f = a:func
  execute "normal! iauto pos = \<esc>\"fpa(begin(\<esc>\"upa), end(\<esc>\"upa), );\<esc>"
  execute "normal! oif (pos != end(\<esc>\"upa)) {\<cr>}\<esc>"
  execute "normal! 2k$F,"
endfunction

function Cpp_BeginEndValueNoIf( func, return_value )
  execute "normal! b\"udwi  \<esc>"
  let @f = a:func
  let @v = a:return_value
  execute "normal! iauto \<esc>\"vpa = \<esc>\"fpa(begin(\<esc>\"upa), end(\<esc>\"upa), );\<esc>"
  execute "normal! $F,"
endfunction

function Cpp_BeginEndValueUnaryNoIf( func, return_value )
  execute "normal! b\"udwi  \<esc>"
  let @f = a:func
  let @v = a:return_value
  execute "normal! iauto \<esc>\"vpa = \<esc>\"fpa(begin(\<esc>\"upa), end(\<esc>\"upa), "
  execute "normal! i, [](,) {\<cr>});\<esc>04x"
  execute "normal! k$3F,"
endfunction

function Cpp_BeginEndValueReturnValue( func, value )
  execute "normal! b\"udwi  \<esc>"
  let @f = a:func
  let @v = a:value
  execute "normal! iauto \<esc>\"vpa = \<esc>\"fpa(begin(\<esc>\"upa), "
  execute "normal! i end(\<esc>\"upa),  );\<esc>"
  execute "normal! F,l"
endfunction

function Cpp_AccumulateWithLambda( func, value )
  execute "normal! b\"udwi  \<esc>"
  let @f = a:func
  let @v = a:value
  execute "normal! iauto \<esc>\"vpa = \<esc>\"fpa(begin(\<esc>\"upa), "
  execute "normal! i end(\<esc>\"upa), 0, [](int total, #) {\<cr>});\<esc>"
  execute "normal! 04xkf#x"
endfunction

function Cpp_BeginEndValueNoReturn( func )
  execute "normal! b\"udwi  \<esc>"
  let @f = a:func
  execute "normal! i\<esc>\"fpa(begin(\<esc>\"upa), end(\<esc>\"upa), );\<esc>"
  execute "normal! F,"
endfunction

function Cpp_BeginEndOldValueNewValue( func )
  execute "normal! b\"udwi  \<esc>"
  let @f = a:func
  execute "normal! i\<esc>\"fpa(begin(\<esc>\"upa), end(\<esc>\"upa), old_value, new_value );\<esc>"
  execute "normal! Fo"
endfunction

function Cpp_BeginEndUnaryValue( func )
  execute "normal! b\"udwi  \<esc>"
  let @f = a:func
  execute "normal! i\<esc>\"fpa(begin(\<esc>\"upa), end(\<esc>\"upa), [](#) {\<cr>}, );\<esc>"
  execute "normal! 04xk0f#x"
endfunction

function Cpp_BeginEndBeginOldValueNewValue( func )
  execute "normal! b\"udwi  \<esc>"
  let @f = a:func
  execute "normal! i\<esc>\"fpa(begin(\<esc>\"upa), end(\<esc>\"upa), begin(\<esc>\"upa), old_value, new_value);\<esc>"
  execute "normal! Fo"
endfunction

function Cpp_BeginEndBeginUnaryValue( func )
  execute "normal! b\"udwi  \<esc>"
  let @f = a:func
  execute "normal! i\<esc>\"fpa(begin(\<esc>\"upa), end(\<esc>\"upa), "
  execute "normal! i begin(\<esc>\"upa), [](#) {\<cr>}, );\<esc>"
  execute "normal! 04xk0f#x"
endfunction

function Cpp_IfBeginEndBeginEnd( func )
  execute "normal! b\"udwi  \<esc>"
  let @f = a:func
  execute "normal! iif (\<esc>\"fpa(begin(\<esc>\"upa), end(\<esc>\"upa), "
  execute "normal! i begin(#), end())) {\<cr>}"
  execute "normal! k0f#x"
endfunction

function Cpp_BeginEndEnd( func )
  execute "normal! b\"udwi  \<esc>"
  let @f = a:func
  execute "normal! i\<esc>\"fpa(begin(\<esc>\"upa), end(\<esc>\"upa), end(\<esc>\"upa));"
  execute "normal! 0w"
endfunction

function Cpp_BeginEndBegin( func )
  execute "normal! b\"udwi  \<esc>"
  let @f = a:func
  execute "normal! i\<esc>\"fpa(begin(\<esc>\"upa), end(\<esc>\"upa), begin(#));\<esc>"
  execute "normal! 0f#x"
endfunction

function Cpp_BeginBeginEnd( func )
  execute "normal! b\"udwi  \<esc>"
  let @f = a:func
  execute "normal! i\<esc>\"fpa(begin(\<esc>\"upa), begin(\<esc>\"upa), end(#));"
  execute "normal! 0f#x"
endfunction

function Cpp_BeginEndBeginValue( func )
  execute "normal! b\"udwi  \<esc>"
  let @f = a:func
  execute "normal! i\<esc>\"fpa(begin(\<esc>\"upa), end(\<esc>\"upa), begin(#), );"
  execute "normal! 0f#x"
endfunction

function Cpp_BeginEndBeginUnary( func )
  execute "normal! b\"udwi  \<esc>"
  let @f = a:func
  execute "normal! i\<esc>\"fpa(begin(\<esc>\"upa), end(\<esc>\"upa), begin(#), "
  execute "normal! i []() {\<cr>"
  execute "normal! i  });\<esc>kf#x"
endfunction

function Cpp_BeginEndBeginEnd( func )
  execute "normal! b\"udwi  \<esc>"
  let @f = a:func
  execute "normal! i\<esc>\"fpa(begin(\<esc>\"upa), end(\<esc>\"upa), "
  execute "normal! i begin(#), end());"
  execute "normal! 0f#x"
endfunction

function Cpp_BeginEndBeginEndUnary( func )
  execute "normal! b\"udwi  \<esc>"
  let @f = a:func
  execute "normal! i\<esc>\"fpa(begin(\<esc>\"upa), end(\<esc>\"upa), "
  execute "normal! i begin(#), end(), []() {\<cr>});"
  execute "normal! 04xkf#x"
endfunction

function Cpp_BeginEndBeginEndBegin( func )
  execute "normal! b\"udwi  \<esc>"
  let @f = a:func
  execute "normal! i\<esc>\"fpa(begin(\<esc>\"upa), end(\<esc>\"upa), "
  execute "normal! i begin(#), end(), begin());"
  execute "normal! 0f#x"
endfunction

function Cpp_BeginBeginEndBegin( func )
  execute "normal! b\"udwi  \<esc>"
  let @f = a:func
  execute "normal! i\<esc>\"fpa(begin(\<esc>\"upa), begin(#), \<cr> "
  execute "normal! iend(\<esc>\"upa), begin() ); "
  execute "normal! k0f#x"
endfunction

function Cpp_IteratorValueIterator( func, it1, value, it2 ) 
  execute "normal! b\"udwi  \<esc>"
  let @i = a:it1
  let @j = a:it2
  let @f = a:func
  let @v = a:value
  execute "normal! i\<esc>\"fpa( \<esc>\"ipa(\<esc>\"upa), \<esc>\"vpa, \<esc>\"jpa(\<esc>\"upa) );\<esc>"
  execute "normal! 0w"
endfunction

function Cpp_BeginSizeValue( func ) 
  execute "normal! b\"udwi  \<esc>"
  let @f = a:func
  execute "normal! i\<esc>\"fpa(begin(\<esc>\"upa), \<esc>\"upa.size(), );\<esc>"
  execute "normal! F,"
endfunction

function Cpp_BeginSizeFunc( func ) 
  execute "normal! b\"udwi  \<esc>"
  let @f = a:func
  execute "normal! i\<esc>\"fpa(begin(\<esc>\"upa), \<esc>\"upa.size(), "
  execute "normal! i []() {\<cr>"
  execute "normal! i  });\<esc>k0w"
endfunction

function Cpp_LambdaOneLine()
  execute "normal! F,a []( const auto& elem ) {\<esc>f)hi}\<esc>F{l"
endfunction

function Cpp_LambdaMultiLine()
  call Cpp_LambdaOneLine()
  execute "normal! F[i\<cr>\<esc>f{li\<cr>\<esc>>>>>f}hi\<cr>\<esc>04x2kf&h"
endfunction

function Cpp_FindEnd()
  execute "normal! b\"udwi  \<esc>"
  execute "normal! iauto pos = find_end(begin(\<esc>\"upa), end(\<esc>\"upa), "
  execute "normal! i begin(#), end() );\<esc>0"
  execute "normal! oif (pos != end(\<esc>pa)) {\<cr>}\<esc>"
  execute "normal! 2k0f#x"
endfunction

function Cpp_Search()
  execute "normal! b\"udwi  \<esc>"
  execute "normal! iauto pos = search(begin(\<esc>\"upa), end(\<esc>\"upa), "
  execute "normal! i begin(#), end() );\<esc>0"
  execute "normal! oif (pos != end(\<esc>pa)) {\<cr>}\<esc>"
  execute "normal! 2k0f#x"
endfunction

function Cpp_SearchN()
  execute "normal! b\"udwi  \<esc>"
  execute "normal! iauto pos = search_n(begin(\<esc>\"upa), end(\<esc>\"upa), "
  execute "normal! i #, );\<esc>0"
  execute "normal! oif (pos != end(\<esc>pa)) {\<cr>}\<esc>"
  execute "normal! 2k0f#x"
endfunction

function Cpp_FindFirstOf()
  execute "normal! b\"udwi  \<esc>"
  execute "normal! iauto pos = find_first_of(begin(\<esc>\"upa), end(\<esc>\"upa), "
  execute "normal! i begin(#), end() );\<esc>0"
  execute "normal! oif (pos != end(\<esc>pa)) {\<cr>}\<esc>"
  execute "normal! 2k0f#x"
endfunction

function Cpp_AdjacentFind()
  execute "normal! b\"udwi  \<esc>"
  execute "normal! iauto pos = adjacent_find(begin(\<esc>\"upa), end(\<esc>\"upa));\<esc>"
  execute "normal! oif (pos != end(\<esc>\"upa)) {\<cr>}\<esc>"
  execute "normal! k0w"
endfunction

function Cpp_Equal()
  execute "normal! b\"udwi  \<esc>"
  execute "normal! iif (equal(begin(\<esc>\"upa), end(\<esc>\"upa), \<esc>"
  execute "normal! i begin(\<esc>\"upa))) {\<cr>}\<esc>k"
endfunction

function Cpp_IsPermutation()
  execute "normal! b\"udwi  \<esc>"
  execute "normal! iif (is_permutation(begin(\<esc>\"upa), end(\<esc>\"upa), \<esc>"
  execute "normal! i begin(\<esc>\"upa))) {\<cr>}\<esc>k"
endfunction

function Cpp_Mismatch()
  execute "normal! b\"udwi  \<esc>"
  execute "normal! iauto values = mismatch(begin(\<esc>\"upa), end(\<esc>\"upa), "
  execute "normal! i begin(\<esc>\"upa));\<esc>0"
  execute "normal! oif (values.first == end(\<esc>pa)) {\<cr>} else {\<cr>}"
  execute "normal! 2k"
endfunction

function Cpp_UniqueCopy()
  execute "normal! \<esc>b\"udwi \<esc>"
  execute "normal! i unique_copy(begin(\<esc>pa), end(\<esc>pa),\<cr>"
  execute "normal! i              ostream_iterator<#>(cout, \"\\n\"));"
  execute "normal! 0f#x"
endfunction

function Cpp_MakeTransform( source, destination, elemtype, statement )
  call setline( ".", "  transform(begin(" . a:source . "), end(" . a:source . "), begin(" . a:source . "), []( ". a:elemtype . ") { " . a:statement . " });" )
endfunction 

function Cpp_SetAlgorithm( func )
  execute "normal! b\"udwi  \<esc>"
  let @f = a:func
  execute "normal! iauto pos = \<esc>\"fpa(begin(\<esc>\"upa), end(\<esc>\"upa), "
  execute "normal! i begin(#), end(), begin());"
  execute "normal! 0f#x"
endfunction

function Cpp_StreamOutput()
  execute "normal! b\"udwi  \<esc>"
  execute "normal! icopy(begin(\<esc>\"upa), end(\<esc>\"upa), "
  execute "normal! i ostream_iterator<#>{\<cr>    cout, \"\"\<cr>});"
  execute "normal! 05x2kf#x"
endfunction

function Cpp_Swap()
  execute "normal! \<esc>b\"udwi \<esc>"
  execute "normal! i swap(\<esc>pa, );" 
  execute "normal! $F,l" 
endfunction

function Cpp_Transform()
  execute "normal! Byw"
  call Cpp_MakeTransform( @", @", "elemtype elem", "return elem; // Return transformed value" )
endfunction

function Cpp_ToUpper()
  execute "normal! yw"
  call Cpp_MakeTransform( @", @", "char c", "return toupper( c );" )
endfunction

function Cpp_ToLower()
  execute "normal! yw"
  call Cpp_MakeTransform( @", @", "char c", "return tolower( c );" )
endfunction

function Cpp_LeftTrim()
  execute "normal! \<esc>b\"udwi \<esc>"
  execute "normal! i  \<esc>\"uPa.erase(0, \<esc>\"upa.find_first_not_of(\" \\t\\n\\r\"));"
endfunction

function Cpp_RightTrim()
  execute "normal! \<esc>b\"udwi \<esc>"
  execute "normal! i  \<esc>\"uPa.erase(\<esc>\"upa.find_last_not_of(\" \\t\\n\\r\")+1);"
endfunction

