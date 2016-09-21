" Vim filetype plugin to map keys used for C++ 
" Maintainer: Tommy Bennett tommy_bennett@icloud.com
" License: This file is placed in the public domain.

if exists("g:loaded_cppmap")
  finish
endif
let g:loaded_cppmap = 1

" if blocks
imap ,e <esc>/}<cr>A else{<cr>
imap ,f <esc>/}<cr>A else if<space>
imap ,, <esc>/}<cr>o<cr>
map ,, /}<cr>o<cr>

" brace expansion
inoremap {<cr> <esc>A{<cr>}<esc>ko
inoremap {<space> { 
inoremap {{ {
inoremap {} {}

" matching quotations and brackets 
" inoremap " ""<esc>i
" inoremap [ [  ]<esc>hi

" switch blocks
imap ,c <esc>joca 
imap ,d <esc>jode 

" macros 
inoremap ,p <esc>:call Cpp_MakePropertyFromLine()<cr>o
noremap ,t :call Cpp_ToggleHeader()<cr>
noremap ,T :call Cpp_ToggleTest()<cr>
noremap ,h :call Cpp_Header()<cr>

" refactorings
noremap <C-x>ic <esc>:call Cpp_ImplementConstructor()<cr>
noremap <C-x>id <esc>:call Cpp_ImplementDestructor()<cr>
noremap <C-x>nc :call Cpp_NoClassCopy()<cr>
noremap <C-x>cp :call Cpp_ClassCopy()<cr>
noremap <C-x>if <esc>:call Cpp_ImplementFunctionFromLine()<cr>
noremap <C-x>if <esc>:call Cpp_ImplementFunctionFromLine()<cr>
inoremap <C-x>im <esc>:call Cpp_ImplementMethodFromLine()<cr>
noremap <C-x>im <esc>:call Cpp_ImplementMethodFromLine()<cr>
inoremap <C-x>iv <esc>:call Cpp_IntroduceVariable()<cr>a
inoremap <C-x>is <esc>:call Cpp_ImplementStreamOperator()<cr>
inoremap <C-x>it <esc>:call Cpp_IterateContainer()<cr>

" Nonmodifying algorithms
inoremap <C-k>fre <esc>:call Cpp_BeginEndUnaryNoReturn( "for_each" )<cr>
inoremap <C-k>cnt <esc>:call Cpp_BeginEndValueReturnValue( "count", "num" )<cr>a
inoremap <C-k>cni <esc>:call Cpp_BeginEndUnaryNoIf( "count_if", "num" )<cr>
inoremap <C-k>mne <esc>:call Cpp_BeginEndNoIf( "min_element", "pos" )<cr>
inoremap <C-k>mxe <esc>:call Cpp_BeginEndNoIf( "max_element", "pos" )<cr>
inoremap <C-k>mme <esc>:call Cpp_BeginEndNoIf( "minmax_element", "minmax" )<cr>
inoremap <C-k>fnd <esc>:call Cpp_BeginEndValue( "find" )<cr>a 
inoremap <C-k>fni <esc>:call Cpp_BeginEndUnary( "find_if" )<cr>
inoremap <C-k>fin <esc>:call Cpp_BeginEndUnary( "find_if_not" )<cr>
inoremap <C-k>fne <esc>:call Cpp_FindEnd()<cr>
inoremap <C-k>srh <esc>:call Cpp_Search()<cr>
inoremap <C-k>srn <esc>:call Cpp_SearchN()<cr>
inoremap <C-k>ffo <esc>:call Cpp_FindFirstOf()<cr>
inoremap <C-k>ajf <esc>:call Cpp_AdjacentFind()<cr>
inoremap <C-k>eql <esc>:call Cpp_Equal()<cr>
inoremap <C-k>ipr <esc>:call Cpp_IsPermutation()<cr>
inoremap <C-k>msm <esc>:call Cpp_Mismatch()<cr>
inoremap <C-k>iss <esc>:call Cpp_IfBeginEnd( "is_sorted" )<cr>
inoremap <C-k>isu <esc>:call Cpp_BeginEnd( "is_sorted_until" )<cr>
inoremap <C-k>ipt <esc>:call Cpp_IfBeginEndUnary( "is_partitioned" )<cr>
inoremap <C-k>ppt <esc>:call Cpp_BeginEndUnary( "partition_point" )<cr>a
inoremap <C-k>ihp <esc>:call Cpp_IfBeginEnd( "is_heap" )<cr>
inoremap <C-k>ihu <esc>:call Cpp_BeginEnd( "is_heap_until" )<cr>
inoremap <C-k>alo <esc>:call Cpp_IfBeginEndUnary( "all_of" )<cr>
inoremap <C-k>ano <esc>:call Cpp_IfBeginEndUnary( "any_of" )<cr>
inoremap <C-k>nno <esc>:call Cpp_IfBeginEndUnary( "none_of" )<cr>
inoremap <C-k>lxc <esc>:call Cpp_IfBeginEndBeginEnd( "lexicographical_compare" )<cr>

" Sorting algorithms
inoremap <C-k>srt <esc>:call Cpp_BeginEndNoReturn( "sort" )<cr>
inoremap <C-k>sts <esc>:call Cpp_BeginEndNoReturn( "stable_sort" )<cr>
inoremap <C-k>pst <esc>:call Cpp_BeginEndEnd( "partial_sort" )<cr>
inoremap <C-k>psc <esc>:call Cpp_BeginEndBeginEnd( "partial_sort_copy", "dest" )<cr>
inoremap <C-k>nth <esc>:call Cpp_BeginEndEnd( "nth_element" )<cr>
inoremap <C-k>ptn <esc>:call Cpp_BeginEndUnary( "partition" )<cr>a
inoremap <C-k>spt <esc>:call Cpp_BeginEndUnary( "stable_partition" )<cr>a
inoremap <C-k>ptc <esc>:call Cpp_BeginEndBeginEnd( "partition_copy", "dest" )<cr>
inoremap <C-k>mkh <esc>:call Cpp_BeginEndNoReturn( "make_heap" )<cr>
inoremap <C-k>phh <esc>:call Cpp_BeginEndNoReturn( "push_heap" )<cr>
inoremap <C-k>pph <esc>:call Cpp_BeginEndNoReturn( "pop_heap" )<cr>
inoremap <C-k>sth <esc>:call Cpp_BeginEndNoReturn( "sort_heap" )<cr>

" Algorithms for sorted ranges
inoremap <C-k>bns <esc>:call Cpp_BeginEndValue( "binary_search" )<cr>a 
inoremap <C-k>inc <esc>:call Cpp_BeginEndBeginEnd( "includes", "search" )<cr>
inoremap <C-k>lwb <esc>:call Cpp_BeginEndValue( "lower_bound" )<cr>a 
inoremap <C-k>upb <esc>:call Cpp_BeginEndValue( "upper_bound" )<cr>a 
inoremap <C-k>eqr <esc>:call Cpp_BeginEndValue( "equal_range" )<cr>a 
inoremap <C-k>mrg <esc>:call Cpp_BeginEndBeginEndBegin( "merge", "source2", "dest" )<cr>
inoremap <C-k>stu <esc>:call Cpp_BeginEndBeginEndBegin( "set_union", "source2", "dest" )<cr>
inoremap <C-k>sti <esc>:call Cpp_BeginEndBeginEndBegin( "set_intersection", "source2", "dest" )<cr>
inoremap <C-k>std <esc>:call Cpp_BeginEndBeginEndBegin( "set_difference", "source2", "dest" )<cr>
inoremap <C-k>ssd <esc>:call Cpp_BeginEndBeginEndBegin( "set_symmetric_difference", "source2", "dest" )<cr>
inoremap <C-k>ipm <esc>:call Cpp_BeginEndEnd( "inplace_merge" )<cr>
inoremap <C-k>ucp <esc>:call Cpp_UniqueCopy()<cr>

" Modifying algorithms
inoremap <C-k>cpy <esc>:call Cpp_BeginEndBegin( "copy" )<cr>
inoremap <C-k>cpi <esc>:call Cpp_BeginEndBeginUnary( "copy_if" )<cr>
inoremap <C-k>cpn <esc>:call Cpp_IteratorValueIterator( "copy_n", "begin", "n", "end" )<cr>
inoremap <C-k>cpb <esc>:call Cpp_BeginEndEnd( "copy_backward" )<cr>
inoremap <C-k>mov <esc>:call Cpp_BeginEndBegin( "move" )<cr>
inoremap <C-k>mvb <esc>:call Cpp_BeginEndEnd( "move_backward" )<cr>
inoremap <C-k>tfm <esc>:call Cpp_BeginEndBeginUnary( "transform" )<cr>
inoremap <C-k>mrg <esc>:call Cpp_BeginEndBeginEndBegin( "merge", "source2", "dest" )<cr>
inoremap <C-k>swp <esc>:call Cpp_Surround( "swap" )<cr>
inoremap <C-k>swr <esc>:call Cpp_BeginEndBegin( "swap_ranges" )<cr>
inoremap <C-k>fil <esc>:call Cpp_BeginEndValueNoReturn( "fill" )<cr>a 
inoremap <C-k>fln <esc>:call Cpp_BeginSizeValue( "fill_n" )<cr>a 
inoremap <C-k>gnr <esc>:call Cpp_BeginEndUnary( "generate" )<cr>
inoremap <C-k>gnn <esc>:call Cpp_BeginSizeFunc( "generate_n" )<cr>
inoremap <C-k>rpl <esc>:call Cpp_BeginEndOldValueNewValue( "replace" )<cr>
inoremap <C-k>rpi <esc>:call Cpp_BeginEndUnaryValue( "replace_if" )<cr>
inoremap <C-k>rpc <esc>:call Cpp_BeginEndBeginOldValueNewValue( "replace_copy" )<cr>
inoremap <C-k>rci <esc>:call Cpp_BeginEndBeginUnaryValue( "replace_copy_if" )<cr>
inoremap <C-k>ita <esc>:call Cpp_BeginEndValueNoReturn( "iota" )<cr>a 

" Removing algorithms
inoremap <C-k>rmv <esc>:call Cpp_BeginEndValue( "remove" )<cr>a 
inoremap <C-k>rmi <esc>:call Cpp_BeginEndUnary( "remove_if" )<cr>
inoremap <C-k>rmc <esc>:call Cpp_BeginEndBeginValue( "remove_copy" )<cr>a 
inoremap <C-k>rmf <esc>:call Cpp_BeginEndBeginUnary( "remove_copy_if" )<cr>
inoremap <C-k>uqe <esc>:call Cpp_BeginEndNoIf( "unique", "pos" )<cr>
inoremap <C-k>uqc <esc>:call Cpp_BeginEndBegin( "unique_copy" )<cr>

" Mutating algorithms
inoremap <C-k>rvr <esc>:call Cpp_BeginEndNoReturn( "reverse" )<cr>
inoremap <C-k>rvc <esc>:call Cpp_BeginEndBegin( "reverse_copy" )<cr>
inoremap <C-k>rte <esc>:call Cpp_BeginBeginEnd( "rotate" )<cr>
inoremap <C-k>rtc <esc>:call Cpp_BeginBeginEndBegin( "rotate_copy", "new", "dest" )<cr>
inoremap <C-k>nxp <esc>:call Cpp_IfBeginEnd( "next_permutation" )<cr>
inoremap <C-k>prp <esc>:call Cpp_IfBeginEnd( "prev_permutation" )<cr>
inoremap <C-k>shf <esc>:call Cpp_BeginEndNoReturn( "random_shuffle" )<cr>

" Numeric algorithms
inoremap <C-k>acm <esc>:call Cpp_BeginEndValueReturnValue( "accumulate", "sum" )<cr>a

" lambdas
inoremap <C-k>lam <esc>:call Cpp_LambdaOneLine()<cr>a
inoremap <C-k>lml <esc>:call Cpp_LambdaMultiLine()<cr>a

" strings
inoremap <C-k>ltr <esc>:call Cpp_LeftTrim()<cr>
inoremap <C-k>trm <esc>:call Cpp_RightTrim()<cr>

" algorithms
inoremap <C-x>tr <esc>:call Cpp_Transform()<cr>
inoremap <C-x>tu <esc>:call Cpp_ToUpper()<cr>
inoremap <C-x>tl <esc>:call Cpp_ToLower()<cr>
inoremap <C-x>si <esc>:call Cpp_StreamInput()<cr>
inoremap <C-x>so <esc>:call Cpp_StreamOutput()<cr>

" formatting
noremap =f :call Cpp_FormatFunctionParameters()<cr>
noremap =a 02xwdwyt;wi = rhs.p0j
noremap =c :call Cpp_FormatConstructorInitializers()<cr>

