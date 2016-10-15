" Vim filetype plugin to map keys used for C++ 
" Maintainer: Tommy Bennett tommy_bennett@icloud.com
" License: This file is placed in the public domain.

if exists("g:loaded_cppmap")
  finish
endif
let g:loaded_cppmap = 1

" Nonmodifying algorithms
inoremap <C-k>fre <esc>:call Cpp_BeginEndUnaryNoReturn( "for_each" )<cr>i
inoremap <C-k>cnt <esc>:call Cpp_BeginEndValueReturnValue( "count", "n" )<cr>a
inoremap <C-k>cni <esc>:call Cpp_BeginEndUnaryNoIf( "count_if", "n" )<cr>i
inoremap <C-k>mne <esc>:call Cpp_BeginEndNoIf( "min_element", "pos" )<cr>
inoremap <C-k>mxe <esc>:call Cpp_BeginEndNoIf( "max_element", "pos" )<cr>
inoremap <C-k>mme <esc>:call Cpp_BeginEndNoIf( "minmax_element", "minmax" )<cr>
inoremap <C-k>fnd <esc>:call Cpp_BeginEndValue( "find" )<cr>a 
inoremap <C-k>fni <esc>:call Cpp_BeginEndUnary( "find_if" )<cr>i
inoremap <C-k>fin <esc>:call Cpp_BeginEndUnary( "find_if_not" )<cr>i
inoremap <C-k>fne <esc>:call Cpp_FindEnd()<cr>i
inoremap <C-k>srh <esc>:call Cpp_Search()<cr>i
inoremap <C-k>srn <esc>:call Cpp_SearchN()<cr>i
inoremap <C-k>ffo <esc>:call Cpp_FindFirstOf()<cr>i
inoremap <C-k>ajf <esc>:call Cpp_AdjacentFind()<cr>o
inoremap <C-k>eql <esc>:call Cpp_Equal()<cr>o
inoremap <C-k>ipr <esc>:call Cpp_IsPermutation()<cr>o
inoremap <C-k>msm <esc>:call Cpp_Mismatch()<cr>o
inoremap <C-k>iss <esc>:call Cpp_IfBeginEnd( "is_sorted" )<cr>o
inoremap <C-k>isu <esc>:call Cpp_BeginEnd( "is_sorted_until" )<cr>o
inoremap <C-k>ipt <esc>:call Cpp_IfBeginEndUnary( "is_partitioned" )<cr>i
inoremap <C-k>ppt <esc>:call Cpp_BeginEndUnary( "partition_point" )<cr>i
inoremap <C-k>ihp <esc>:call Cpp_IfBeginEnd( "is_heap" )<cr>o
inoremap <C-k>ihu <esc>:call Cpp_BeginEnd( "is_heap_until" )<cr>o
inoremap <C-k>alo <esc>:call Cpp_IfBeginEndUnary( "all_of" )<cr>i
inoremap <C-k>ano <esc>:call Cpp_IfBeginEndUnary( "any_of" )<cr>i
inoremap <C-k>nno <esc>:call Cpp_IfBeginEndUnary( "none_of" )<cr>i
inoremap <C-k>lxc <esc>:call Cpp_IfBeginEndBeginEnd( "lexicographical_compare" )<cr>i

" Sorting algorithms
inoremap <C-k>srt <esc>:call Cpp_BeginEndNoReturn( "sort" )<cr>
inoremap <C-k>sts <esc>:call Cpp_BeginEndNoReturn( "stable_sort" )<cr>
inoremap <C-k>pst <esc>:call Cpp_BeginEndEnd( "partial_sort" )<cr>
inoremap <C-k>psc <esc>:call Cpp_BeginEndBeginEnd( "partial_sort_copy" )<cr>i
inoremap <C-k>nth <esc>:call Cpp_BeginEndEnd( "nth_element" )<cr>
inoremap <C-k>ptn <esc>:call Cpp_BeginEndUnary( "partition" )<cr>i
inoremap <C-k>spt <esc>:call Cpp_BeginEndUnary( "stable_partition" )<cr>i
inoremap <C-k>ptc <esc>:call Cpp_BeginEndBeginEndUnary( "partition_copy" )<cr>i
inoremap <C-k>mkh <esc>:call Cpp_BeginEndNoReturn( "make_heap" )<cr>
inoremap <C-k>phh <esc>:call Cpp_BeginEndNoReturn( "push_heap" )<cr>
inoremap <C-k>pph <esc>:call Cpp_BeginEndNoReturn( "pop_heap" )<cr>
inoremap <C-k>sth <esc>:call Cpp_BeginEndNoReturn( "sort_heap" )<cr>

" Algorithms for sorted ranges
inoremap <C-k>bns <esc>:call Cpp_BeginEndValue( "binary_search" )<cr>a 
inoremap <C-k>inc <esc>:call Cpp_BeginEndBeginEnd( "includes" )<cr>i
inoremap <C-k>lwb <esc>:call Cpp_BeginEndValue( "lower_bound" )<cr>a 
inoremap <C-k>upb <esc>:call Cpp_BeginEndValue( "upper_bound" )<cr>a 
inoremap <C-k>eqr <esc>:call Cpp_BeginEndValueNoIf( "equal_range", "bounds" )<cr>a
inoremap <C-k>erl <esc>:call Cpp_BeginEndValueUnaryNoIf( "equal_range", "bounds" )<cr>a
inoremap <C-k>mrg <esc>:call Cpp_BeginEndBeginEndBegin( "merge" )<cr>i
inoremap <C-k>stu <esc>:call Cpp_SetAlgorithm( "set_union" )<cr>i
inoremap <C-k>sti <esc>:call Cpp_SetAlgorithm( "set_intersection" )<cr>i
inoremap <C-k>std <esc>:call Cpp_SetAlgorithm( "set_difference" )<cr>i
inoremap <C-k>ssd <esc>:call Cpp_SetAlgorithm( "set_symmetric_difference" )<cr>i
inoremap <C-k>ipm <esc>:call Cpp_BeginEndEnd( "inplace_merge" )<cr>
inoremap <C-k>ucp <esc>:call Cpp_UniqueCopy()<cr>i

" Modifying algorithms
inoremap <C-k>cpy <esc>:call Cpp_BeginEndBegin( "copy" )<cr>i
inoremap <C-k>cpi <esc>:call Cpp_BeginEndBeginUnary( "copy_if" )<cr>i
inoremap <C-k>cpn <esc>:call Cpp_IteratorValueIterator( "copy_n", "begin", "n", "end" )<cr>
inoremap <C-k>cpb <esc>:call Cpp_BeginEndEnd( "copy_backward" )<cr>
inoremap <C-k>mov <esc>:call Cpp_BeginEndBegin( "move" )<cr>
inoremap <C-k>mvb <esc>:call Cpp_BeginEndEnd( "move_backward" )<cr>
inoremap <C-k>tfm <esc>:call Cpp_BeginEndBeginUnary( "transform" )<cr>i
inoremap <C-k>swr <esc>:call Cpp_BeginEndBegin( "swap_ranges" )<cr>i
inoremap <C-k>fil <esc>:call Cpp_BeginEndValueNoReturn( "fill" )<cr>a 
inoremap <C-k>fln <esc>:call Cpp_BeginSizeValue( "fill_n" )<cr>a 
inoremap <C-k>gnr <esc>:call Cpp_BeginEndUnary( "generate" )<cr>o
inoremap <C-k>gnn <esc>:call Cpp_BeginSizeFunc( "generate_n" )<cr>o
inoremap <C-k>rpl <esc>:call Cpp_BeginEndOldValueNewValue( "replace" )<cr>
inoremap <C-k>rpi <esc>:call Cpp_BeginEndUnaryValue( "replace_if" )<cr>i
inoremap <C-k>rpc <esc>:call Cpp_BeginEndBeginOldValueNewValue( "replace_copy" )<cr>
inoremap <C-k>rci <esc>:call Cpp_BeginEndBeginUnaryValue( "replace_copy_if" )<cr>i
inoremap <C-k>ita <esc>:call Cpp_BeginEndValueNoReturn( "iota" )<cr>a 
inoremap <C-k>swp <esc>:call Cpp_Swap()<cr>a

" Removing algorithms
inoremap <C-k>rmv <esc>:call Cpp_BeginEndValue( "remove" )<cr>a 
inoremap <C-k>rmi <esc>:call Cpp_BeginEndUnary( "remove_if" )<cr>i
inoremap <C-k>rmc <esc>:call Cpp_BeginEndBeginValue( "remove_copy" )<cr>i
inoremap <C-k>rmf <esc>:call Cpp_BeginEndBeginUnary( "remove_copy_if" )<cr>i
inoremap <C-k>uqe <esc>:call Cpp_BeginEndNoIf( "unique", "pos" )<cr>
inoremap <C-k>uqc <esc>:call Cpp_BeginEndBegin( "unique_copy" )<cr>i

" Mutating algorithms
inoremap <C-k>rvr <esc>:call Cpp_BeginEndNoReturn( "reverse" )<cr>
inoremap <C-k>rvc <esc>:call Cpp_BeginEndBegin( "reverse_copy" )<cr>i
inoremap <C-k>rte <esc>:call Cpp_BeginBeginEnd( "rotate" )<cr>i
inoremap <C-k>rtc <esc>:call Cpp_BeginBeginEndBegin( "rotate_copy" )<cr>i
inoremap <C-k>nxp <esc>:call Cpp_IfBeginEnd( "next_permutation" )<cr>
inoremap <C-k>prp <esc>:call Cpp_IfBeginEnd( "prev_permutation" )<cr>
inoremap <C-k>shf <esc>:call Cpp_BeginEndNoReturn( "random_shuffle" )<cr>

" Numeric algorithms
inoremap <C-k>acm <esc>:call Cpp_BeginEndValueReturnValue( "accumulate", "sum" )<cr>a
inoremap <C-k>acl <esc>:call Cpp_AccumulateWithLambda( "accumulate", "sum" )<cr>i

" Strings
inoremap <C-k>ltr <esc>:call Cpp_LeftTrim()<cr>
inoremap <C-k>trm <esc>:call Cpp_RightTrim()<cr>
inoremap <C-k>upr <esc>:call Cpp_ToUpper()<cr>
inoremap <C-k>lwr <esc>:call Cpp_ToLower()<cr>

" Streams
inoremap <C-k>oit <esc>:call Cpp_StreamOutput()<cr>i

" Abbreviations
call Iab('sto', 'cout << ')
call Iab('sti', 'cin >> ')
call Iab('stv', 'vector<')

