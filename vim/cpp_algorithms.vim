" Vim global plugin for C++ algorithms 
" Maintainer: Tommy Bennett tommy_bennett@icloud.com	
" License: This file is placed in the public domain.

if exists("g:loaded_cppalgo")
  finish
endif
let g:loaded_cppalgo = 1

function Cpp_BeginEnd( func )
  normal B"udwi  
  let @f = a:func
  normal iauto pos = "fpa( begin("upa), end("upa) );
  normal oif pos != end("upa){
  normal dd2kj
endfunction

function Cpp_BeginEndNoIf( func, return_variable )
  normal B"udwi  
  let @f = a:func
  let @v = a:return_variable
  normal iauto "vpa = "fpa( begin("upa), end("upa) );
  normal 0w
endfunction

function Cpp_BeginEndNoReturn( func )
  normal B"udwi  
  let @f = a:func
  normal i"fpa( begin("upa), end("upa) );
  normal 0w
endfunction

function Cpp_BeginEndUnary( func )
  normal B"udwi  
  let @f = a:func
  normal iauto pos = "fpa( begin("upa), end("upa),
  normal i[]( const auto& elem ) {jA );2kw
  normal 3>>3>>3>>3>>3>>3>>3>>3>>
  normal k0f(j
  normal 2joif pos != end("upa){dd4k
  normal dd2k
  normal jf[h
endfunction

function Cpp_BeginEndUnaryNoReturn( func )
  normal B"udwi  
  let @f = a:func
  normal i"fpa( begin("upa), end("upa),
  normal i[]( const auto& elem ) {
  normal ijA );2kw
  normal 3>>3>>3>>3>>3>>3>>3>>3>>
  normal jddk
endfunction

function Cpp_BeginEndUnaryNoIf( func, value )
  normal B"udwi  
  let @f = a:func
  let @v = a:value
  normal iauto "vpa = "fpa( begin(begin("upa), end("upa),
  normal i[]( const auto& elem ) {jA );2kw
  normal 3>>3>>3>>3>>3>>3>>3>>3>>
endfunction

function Cpp_IfBeginEnd( func )
  normal B"udwi  
  let @f = a:func
  normal iif "fpa( begin("upa), end("upa) )
  normal 3lDA { 
  normal ddk
endfunction

function Cpp_IfBeginEndUnary( func )
  normal B"udwi  
  let @f = a:func
  normal iif "fpa( begin("upa), end("upa), unaryOp )
  normal 3lDA { 
  normal ddk
  normal $Fu
endfunction

function Cpp_BeginEndValue( func )
  normal B"udwi  
  let @f = a:func
  normal iauto pos = "fpa( begin("upa), end("upa), );
  normal oif pos != end("upa){
  normal dd2k
  normal $F,
endfunction

function Cpp_BeginEndValueReturnValue( func, value )
  normal B"udwi  
  let @f = a:func
  let @v = a:value
  normal iauto "vpa  = "fpa( begin("upa), end("upa),  );
  normal F,l
endfunction

function Cpp_BeginEndValueNoReturn( func )
  normal B"udwi  
  let @f = a:func
  normal i"fpa( begin("upa), end("upa), );
  normal F,
endfunction

function Cpp_BeginEndOldValueNewValue( func )
  normal B"udwi  
  let @f = a:func
  normal i"fpa( begin("upa), end("upa), oldValue, newValue );
  normal Fo
endfunction

function Cpp_BeginEndUnaryValue( func )
  normal B"udwi  
  let @f = a:func
  normal i"fpa( begin("upa), end("upa), unaryOp, value );
  normal Fu;
endfunction

function Cpp_BeginEndBeginOldValueNewValue( func )
  normal B"udwi  
  let @f = a:func
  normal i"fpa( begin("upa), end("upa), begin("upa), oldValue, newValue );
  normal Fo
endfunction

function Cpp_BeginEndBeginUnaryValue( func )
  normal B"udwi  
  let @f = a:func
  normal i"fpa( begin("upa), end("upa), begin("upa), unaryOp, value );
  normal Fu;
endfunction

function Cpp_IfBeginEndBeginEnd( func )
  normal B"udwi  
  let @f = a:func
  normal iif "fpa( begin("upa), end("upa),  
  normal ibegin(sub"upa), end(sub"upa) ){
  normal k$2X3hx0jddkw
endfunction

function Cpp_BeginEndEnd( func )
  normal B"udwi  
  let @f = a:func
  normal i"fpa( begin("upa), end("upa), end("upa) );
endfunction

function Cpp_BeginEndBegin( func )
  normal B"udwi  
  let @f = a:func
  normal i"fpa( begin("upa), end("upa), begin(dest"upa) );
endfunction

function Cpp_BeginBeginEnd( func )
  normal B"udwi  
  let @f = a:func
  normal i"fpa( begin("upa), begin("upa), end(dest"upa) );
endfunction

function Cpp_BeginEndBeginValue( func )
  normal B"udwi  
  let @f = a:func
  normal i"fpa( begin("upa), end("upa), begin(dest"upa), );
  normal F,
endfunction

function Cpp_BeginEndBeginUnary( func )
  normal B"udwi  
  let @f = a:func
  normal i"fpa( begin("upa), end("upa),
  normal ibegin("upa),
  normal 0>>>>>>>>>>>>
  normal o[]( const auto& elem ) {jA );2kw
  normal jddk 
endfunction

function Cpp_BeginEndBeginEnd( func, secondCollection )
  normal B"udwi  
  let @f = a:func
  let @s = a:secondCollection
  normal i"fpa( begin("upa), end("upa),  
  normal ibegin("spa), end("spa) ); 
  normal 0>>>>>>>>>>>>>>i 
endfunction

function Cpp_BeginEndBeginEndBegin( func, secondCollection, thirdCollection )
  normal B"udwi  
  let @f = a:func
  let @s = a:secondCollection
  let @t = a:thirdCollection
  normal i"fpa( begin("upa), end("upa),  
  normal ibegin("spa), end("spa),  
  normal ibegin("tpa) );
  normal 0>>i 
endfunction

function Cpp_BeginBeginEndBegin( func, secondCollection, thirdCollection )
  normal B"udwi  
  let @f = a:func
  let @s = a:secondCollection
  let @t = a:thirdCollection
  normal i"fpa( begin("upa), begin("sp"upa),  
  normal iend("upa), begin("tp"upa) ); 
  normal 0>>>>>>>>>>>>>>i 
endfunction

function Cpp_IteratorValueIterator( func, it1, value, it2 ) 
  normal B"udwi  
  let @i = a:it1
  let @j = a:it2
  let @f = a:func
  let @v = a:value
  normal i"fpa( "ipa("upa), "vpa, "jpa(dest"upa) );
endfunction

function Cpp_BeginSizeValue( func ) 
  normal B"udwi  
  let @f = a:func
  normal i"fpa( begin("upa), "upa.size(), );
  normal F,
endfunction

function Cpp_BeginSizeFunc( func ) 
  normal B"udwi  
  let @f = a:func
  normal i"fpa( begin("upa), "upa.size(), func );
  normal Ff
endfunction

function Cpp_LambdaOneLine()
  normal F,a []( const auto& elem ) {f)hi}F{l
endfunction

function Cpp_LambdaMultiLine()
  call Cpp_LambdaOneLine()
  normal F[if{li>>>>f}hi04x2kf&h
endfunction

function Cpp_FindEnd()
  normal B"udwi  
  normal iauto pos = find_end( begin("upa), end("upa),  
  normal ibegin(subpa), end(subpa) );0
  normal >>>>>>>>>>>>>>>>>>
  normal oif pos != end(pa){dd4k
  normal jx2j
endfunction

function Cpp_Search()
  normal B"udwi  
  normal iauto pos = search( begin("upa), end("upa),
  normal ibegin(subpa), end(subpa) );0
  normal >>>>>>>>>>>>>>>>
  normal oif pos != end(pa){dd4k
  normal jx2j
endfunction

function Cpp_SearchN()
  normal B"udwi  
  normal iauto pos = search_n( begin("upa), end("upa),
  normal icount, value );0
  normal >>>>>>>>>>>>>>>>>>
  normal oif pos != end(pa){dd4k
  normal jxw
endfunction

function Cpp_FindFirstOf()
  normal B"uyw
  normal iauto pos = find_first_of( begin("upa), end("upa),  
  normal ibegin(search"upa), end(search"upa) );0
  normal k>>>>>>>>>>>>>>>>>>>>>>
  normal j>>>>>>>>>>>>>>>>>>>>>>>>0x
  normal oif pos != end("upa){dd4k
  normal jx2j
endfunction

function Cpp_AdjacentFind()
  normal B"uyw
  normal iauto pos = adjacent_find( begin("upa), end("upa) );
  normal oif pos != end("upa){
  normal ddk
endfunction

function Cpp_Equal()
  normal B"uyw
  normal iif equal( begin("upa), end("upa),
  normal ibegin("upa) ) {
  normal k>>>>>>>>0x
  normal kf)2xXjf)a )
  normal jddk
  normal >>>>>>>>hx
endfunction

function Cpp_IsPermutation()
  normal B"udwi  
  normal iif is_permutation( begin("upa), end("upa), begin("upa) ){
  normal ddk$3h2x^
endfunction

function Cpp_Mismatch()
  normal B"uyw
  normal iauto values = mismatch( begin("upa), end("upa),
  normal ibegin("upa) );0
  normal >>>>>>>>>>>>>>>>>>
  normal oif values.first == end(pa){dd3k>>hx
  normal 3ja else {
  normal dd4kw
endfunction

function Cpp_MakeTransform( source, destination, elemtype, statement )
  call setline( ".", "transform( begin(" . a:source . "), end(" . a:source . ")," ) 
  normal o 
  call setline( ".", "           begin(" . a:source . ")," )
  normal o
  call setline( ".", "           []( " . a:elemtype . " ) " )
  normal i{jA );
  normal O
  call setline( ".", "               " . a:statement )
  normal kdd
  normal 3k5>>
endfunction 

function Cpp_Transform()
  normal Byw
  call Cpp_MakeTransform( @", @", "elemtype elem", "return elem; // Return transformed value" )
endfunction

function Cpp_ToUpper()
  normal Byw
  call Cpp_MakeTransform( @", @", "char c", "return toupper( c );" )
endfunction

function Cpp_ToLower()
  normal Byw
  call Cpp_MakeTransform( @", @", "char c", "return tolower( c );" )
endfunction

function Cpp_StreamInput()
  normal Bdw
  normal icopy( istream_iterator<string>( cin ),
  normal i      istream_iterator<string>(),
  normal i      back_inserter( pa ) );
  normal 2k0x3>>
endfunction

function Cpp_StreamOutput()
  normal Bdw
  normal icopy( pa.cbegin(), pa.cend(),
  normal i      ostream_iterator<string>( cout, "\n" ) );
  normal k0x2>>
endfunction

function Cpp_UniqueCopy()
  normal B"udwi 
  normal iunique_copy( begin(pa), end(pa),
  normal i             ostream_iterator<string>( cout, "\n" ) );
  normal k0x2>>
endfunction
