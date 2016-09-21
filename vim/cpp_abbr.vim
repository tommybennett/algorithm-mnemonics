" Vim filetype plugin for C++ abbreviations 
" Maintainer: Tommy Bennett	tab@ejallen.com
" License: This file is placed in the public domain.

if exists("g:loaded_cppabbr")
  finish
endif
let g:loaded_cppabbr = 1

" Help delete character if it is 'empty space'
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

" if blocks
call Iab('if', 'if (  ) <Left><Left><Left>')

" for blocks
call Iab('fo', 'for (  ) <Left><Left><Left>')

" while blocks
call Iab('w', 'while (  ) <Left><Left><Left>')

" switch blocks
call Iab('sw', 'switch (  ) <Left><Left><Left>')
call Iab('ca', 'case :<CR>break;<Up>')
call Iab('de', 'default:<CR>break;')

" preprocessing directives
call Iab('#i', '#include ')

" keywords
call Iab('cl', 'class {<CR>};<esc>k0ea ')
call Iab('pu', 'public:<CR>')
call Iab('pro', 'protected:<CR>')
call Iab('pri', 'private:<CR>')
call Iab('d', 'delete ')
call Iab('br', 'break;<CR>')
call Iab('cont', 'continue;<CR>')
call Iab('con', 'const ')
call Iab('co', 'cout << ')
call Iab('ce', 'cerr << ')
call Iab('ci', 'cin >> ')
call Iab('en', 'endl;<CR>')
call Iab('tr', 'true')
call Iab('fa', 'false')
call Iab('r', 'return ')
call Iab('op', 'operator ')
call Iab('inl', 'inline ')
call Iab('vir', 'virtual ')

" types
call Iab('a', 'auto ')
call Iab('ui', 'unsigned int ')
call Iab('si', 'size_t ')
call Iab('siz', 'sizeof(')
call Iab('nul', 'nullptr')
call Iab('nu', 'nullptr')
call Iab('us', 'using ')
call Iab('na', 'namespace ')

" stl
call Iab('st', 'string ')
call Iab('strs', 'stringstream ')
call Iab('ma', 'map<')
call Iab('um', 'unordered_map<')
call Iab('se', 'set<')
call Iab('use', 'unordered_set<')
call Iab('ve', 'vector<')
call Iab('sp', 'shared_ptr<')
call Iab('up', 'unique_ptr<')
call Iab('ms', 'make_shared<')
call Iab('mu', 'make_unique<')
call Iab('sn', 'std::')

" templates
call Iab('tem', 'template <typename T> ')

" testing
call Iab('te', 'TEST(')
call Iab('tf', 'TEST_F(')
call Iab('ath', 'ASSERT_THAT( ')
call Iab('atr', 'ASSERT_TRUE( ')
call Iab('afa', 'ASSERT_FALSE( ')
call Iab('ae', 'ASSERT_EQ( ')
call Iab('eq', 'Eq( ')
call Iab('ti', 'Times( ')
call Iab('wo', 'WillOnce( ')
call Iab('mo', 'MOCK_METHOD')
call Iab('ch', 'CHECK(')
call Iab('le', 'LONGS_EQUAL(')
call Iab('se', 'STRCMP_EQUAL(')
call Iab('de', 'DOUBLES_EQUAL(')
call Iab('pe', 'POINTERS_EQUAL(')

call Iab('main', 'int main( int argc, char** argv ) {<CR>return 0;<CR>}<Up><esc>O')

" includes
call Iab('iios', '#include <iostream>')
call Iab('algo', '#include <algorithm>')
call Iab('ifs', '#include <fstream>')
call Iab('iss', '#include <sstream>')
call Iab('ili', '#include <list>')
call Iab('ima', '#include <map>')
call Iab('istr', '#include <string>')
call Iab('ive', '#include <vector>')
call Iab('iex', '#include <stdexcept>')

" other
call Iab('pi', 'pimpl->')

