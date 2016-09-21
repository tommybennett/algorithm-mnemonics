" Vim global plugin for C++ functions 
" Maintainer: Tommy Bennett tommy_bennett@icloud.com	
" License: This file is placed in the public domain.

if exists("g:loaded_cppfunc")
  finish
endif
let g:loaded_cppfunc = 1

function s:LoadFile( filename, checkpath, testfile )
  if bufexists( a:filename )
    execute "buffer " . a:filename
  else
    let filepath = expand("%:h") . "/" . a:filename
    if match(filepath, "tests/") >= 0
      let filepath = substitute(filepath, "tests/", "", "")
    endif
    if match(filepath, "lib/") == -1 && match(filepath, "include/") == -1
      let filepath = a:filename
    elseif a:checkpath
      if match(filepath, "lib/") >= 0
        let filepath = substitute(filepath, "lib", "include", "")
      elseif match(filepath, "include/") >= 0 
        let filepath = substitute(filepath, "include", "lib", "")
      else 
        let filepath = a:filename
      endif
    endif
    write
    if a:testfile
      let filepath = "tests/" . filepath 
    endif
    execute "edit " . filepath
  endif
endfunction

function Cpp_MakePropertyFromLine()
  let line = split(getline('.'))
  normal ma
  call Cpp_MakeProperty( line[0], line[1] )
  normal 'a
endfunction

function Cpp_MakeProperty( property_type, property_name )
  call setline(".", a:property_type . " " . a:property_name . "() const { return " .
    \ a:property_name . "_; }")
  normal >>>>>>

  if !search("public:")
    normal opublic:
  else
    call search("^ *$")
    normal O
  endif

  call setline(".", "void set_" . a:property_name . "( " . a:property_type .
    \ " value ) { " . a:property_name . "_ = value; }")
  normal >>>>>>

  if !search("private:")
    normal oprivate:
  else
    if match(getline(line(".")+1),"(") > 0
      call search("private:")
    endif 
    call search("^ *$")
    normal O
  endif

  call setline(".", a:property_type . " " . a:property_name . "_;")
  normal >>>>>>
endfunction

function Cpp_GetClassName()
  let classname = ""
  normal ma
  if search("^ *class", "b")
    let classname = split(getline("."))[1]
  endif
  normal `a
  return classname 
endfunction

function Cpp_NoClassCopy()
  if search("^ *class", "b")
    let classname = split(getline("."))[1]
    call search("^};")
    normal Oprivate:
    call setline(".", classname . "( const " . classname . "& );")
    normal >>>>>>
    normal o
    call setline(".", classname . "& operator =( const " . classname .  "& );")
    normal >>>>>>
  endif 
endfunction

function Cpp_ClassCopy()
  let classname = Cpp_GetClassName()
  if strlen( classname ) 
    call search("^ *class", "b")
    call search("public:")
    if search("\\~") == 0
      call search("^ *$")
    endif

    " Add copy constructor
    normal O
    call setline(".", classname . "( const " . classname . "& );")
    normal >>>>>>

    " Add assignment operator
    normal o
    call setline(".", classname . "& operator =( const " .
      \ classname .  "& );")
    normal >>>>>>

    " Add initialization member function
    if search("private:") == 0
      call search( "^  };" )
      normal Oprivate:
    endif

    normal o
    call setline('.', "void init( const " . classname . "& );")
    normal >>>>>>

    normal gg
    if search(classname . ".*= *delete;$")
      normal 2dd
    endif 

    " Change implementation file
    call Cpp_ToggleHeader()

    " Find a place to put it
    normal gg
    if search("::\\~")
      normal Ok
    else 
      call Cpp_GotoLastLine()
      normal o
    endif

    " Add copy constructor
    call setline('.', "  " . classname . "::" . classname . "( const " . classname .
          \ "& rhs )") 
    normal 0A {
    call setline('.', "    init( rhs );")
    normal j$o

    " Add assignement operator
    call setline('.', "  " . classname . "& " . classname . 
          \ "::operator =( const " . classname . "& rhs )")
    normal 0A {
    call setline('.', "    init( rhs );")
    normal o
    call setline('.', "    return *this;")
    normal j$o

    " Add initialization member function
    call setline('.', "  void " . classname . "::init( const " . classname .
          \ "& rhs )")
    normal 0A {dd

    call Cpp_ToggleHeader()
  endif 
endfunction

function Cpp_ToggleHeader()
  if match(expand("%:r"), "_test") > 0
    call Cpp_ToggleTest()
    return
  endif

  let ft = expand("%:e")
  if ft == "h"
    normal mu
    call s:LoadFile( expand("%:t:r") . ".*", 1, 0 )
    silent! exe "normal `uzz"
  else
    normal mu
    call s:LoadFile( expand("%:t:r") . ".h", 1, 0 )
    silent! exe "normal `uzz"
  endif  
endfunction

function Cpp_ToggleTest()
  if expand("%:e") == "h"
    call Cpp_ToggleHeader() 
  endif

  if match(expand("%:r"), "_test") > 0
    let root = expand( "%:t:r" )
    normal mu
    call s:LoadFile( strpart( root, 0, strlen( root ) - 5 ) . ".*", 0, 0 )
    silent! exe "normal `uzz"
  else
    normal mu
    call s:LoadFile( expand("%:t:r") . "_test.cpp", 0, 1 ) 
    silent! exe "normal `uzz"
  endif  
endfunction

function Cpp_Header()
  if expand("%:e") != "h"
    if match(expand("%:r"), "_test") > 0
      let root = expand( "%:t:r" )
      normal mu
      call s:LoadFile( strpart( root, 0, strlen( root ) - 5 ) . ".h", 1, 0 )
      silent! exe "normal `uzz"
    else
      normal mu
      call s:LoadFile( expand("%:t:r") . ".h", 1, 0 ) 
      silent! exe "normal `uzz"
    endif  
  endif
  echo
endfunction

function Cpp_ImplementConstructor()
  let classname = Cpp_GetClassName()
  if strlen( classname ) 
    call search("^ *class", "b")
    call search("public:")
    normal o
    call setline('.', classname . "();") 
    normal >>>>>>
    call Cpp_ToggleHeader()
    call Cpp_GotoLastLine()
    normal o
    call setline('.', classname . "::" . classname . "()") 
    normal A {
    call Cpp_ToggleHeader()
  endif
endfunction

function Cpp_ImplementDestructor()
  let classname = Cpp_GetClassName()
  if strlen( classname ) 
    call search("^ *class", "b")
    call search("public:")
    call search("^ *$")
    normal O
    call setline('.', "virtual ~" . classname . "();") 
    normal >>>>>>
    call Cpp_ToggleHeader()
    call Cpp_GotoLastLine()
    normal o
    call setline('.', classname . "::~" . classname . "()") 
    normal 0A {
    call Cpp_ToggleHeader()
  endif
endfunction

function Cpp_ImplementFunctionFromLine()
  let method_decl = substitute( getline('.'), ";", "", "" )
  call Cpp_ToggleHeader()
  call Cpp_GotoLastLine()
  normal O
  let method_clean = substitute( method_decl, ";", "", "" )
  let function_name_idx = match( method_clean, "[A-Za-z0-9_]*(" )
  let return_type = strpart( method_clean, 0, function_name_idx ) 
  let method_signature = strpart( method_clean, function_name_idx )
  call setline(".", return_type . method_signature)
  normal 0wd0A {
  if strlen( @m )
    normal dd"mP
    let @m = ""
  endif
  normal k3>>jddkdw
endfunction

function Cpp_ImplementMethodFromLine()
  let classname = Cpp_GetClassName()
  if strlen( classname ) 
    let line = substitute( getline('.'), ";", "", "" )
    call Cpp_ToggleHeader()
    call Cpp_ImplementMethod( classname, line ) 
  endif
endfunction

function Cpp_ImplementMethod( classname, method_decl )
  call Cpp_GotoLastLine()
  normal O
  let method_clean = substitute( a:method_decl, ";", "", "" )
  let function_name_idx = match( method_clean, "[A-Za-z0-9_]*(" )
  let return_type = strpart( method_clean, 0, function_name_idx ) 
  let method_signature = strpart( method_clean, function_name_idx )
  call setline(".", return_type . a:classname . "::" . 
        \ method_signature)
  normal 0wd0A {
  if strlen( @m )
    normal dd"mP
    let @m = ""
  endif
  normal k3>>jddk
endfunction

function Cpp_FormatFunctionParameters()
  normal 0f(lr
  while search(",", "", line('.'))
    normal lr
  endwhile
  normal j
endfunction

function Cpp_FormatConstructorInitializers()
  normal 02xwdwf;i()lx0wi: 0j
  while match(getline('.'), ";") > -1
    normal 02xwdwf;i()lx0wi, 0j
  endwhile
endfunction

function Cpp_ImplementStreamOperator()
  normal Bdw
  let classname = Cpp_GetClassName()
  if strlen( classname ) 
    let operator = @"
    if match(operator, "<<") > -1
      let operator = "<<"
      let operator_type = "ostream&"
      let operator_arg = "os"
    else
      let operator = ">>"
      let operator_type = "istream&"
      let operator_arg = "is"
    endif
    call setline('.', "friend " . operator_type . " operator " . operator . "( " . operator_type . ", const " . classname . "& );" )
    normal >>>>>> 
    normal ^
    call Cpp_ToggleHeader()
    call Cpp_GotoLastLine()
    normal O
    call setline('.', "  " . operator_type . " operator " . operator . "( " . operator_type . " " . operator_arg . ", const " . classname . "& " . tolower( classname ) . " )" )
    normal 0A {
    normal "i  return " . operator_arg . ";"
    normal >>
    call Cpp_ToggleHeader()
  endif
endfunction

function Cpp_IntroduceVariable()
  normal 2byw
  if search(";", "n", line('.'))
    exe "normal Iauto " . Cpp_Camel2Underscore( @" ) . " = $"
  elseif match(getline('.'), ")") > -1
    exe "normal Wi" . Cpp_Camel2Underscore( @" ) 
  else
    exe "normal A" . Cpp_Camel2Underscore( @" )
    call setline('.',substitute(getline('.'), " *$", "", ""))
    if match(getline('.'), "(") == -1
      normal A;
    endif
  endif 
endfunction

function Cpp_Surround( func )
  let @f = a:func
  normal I"fpa( A ); 
endfunction

function Cpp_IterateContainer()
  normal Bdw
  normal ifor ( auto it = pa.begin(); it != pa.end(); ++it ) {
  normal k3>>jdd0xk0xfi
endfunction

function Cpp_LeftTrim()
  normal B"udwi  
  normal "uPa.erase( 0, "upa.find_first_not_of( " \t\n\r" ) ); 
endfunction

function Cpp_RightTrim()
  normal B"udwi  
  normal "uPa.erase( "upa.find_last_not_of( " \t\n\r" ) + 1 ); 
endfunction
