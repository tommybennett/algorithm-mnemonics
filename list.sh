#! /bin/bash
################################################################################
# Name: list.sh 
#
# Create documentation from Algorithm Mnemonics XML document.
#
# Usage: list.sh [-cm]
#
# Where: -c    Write categories
#        -m    Write markdown format
#
# Author: Tommy Bennett, tommy_bennett@icloud.com
# Date: 2016-10-15
################################################################################

# Constants
declare -r ALGORITHM_MNEMONICS="algorithm_mnemonics.xml"
declare -r SCRIPT_NAME="list.sh"
declare -r SCRIPT_DESCRIPTION="Algorithm Mnemonics Documentation"
declare -r VERSION="version 1.0"
declare -a NAME
declare -a EXPANDEDNAME
declare -r NONMODIFYING=0
declare -r SORTING=1
declare -r SORTEDRANGES=2
declare -r MODIFYING=3
declare -r REMOVING=4
declare -r MUTATING=5
declare -r NUMERIC=6
declare -r IDIOMS=7
declare -r STRINGS=8
declare -r STREAMS=9
declare -r CONTAINERS=10


# Prints the usage information to standard output.
#
function usage() {
  echo "$SCRIPT_NAME ($SCRIPT_DESCRIPTION) $VERSION"
  echo
  echo "usage: $SCRIPT_NAME [-cm]"
  echo
  echo "where:  -c     Write categories"
  echo "        -m     Write markdown format"
  echo 
  exit 1
}

# Prints the version information to standard output.
#
function version() {
  echo "$SCRIPT_NAME ($SCRIPT_DESCRIPTION) $VERSION"
  echo "Copyright (C) 2016 Tommy Bennett."
  echo "License GPLv3+: GNU GPL version 3 or" \
    "later <http://gnu.org/licenses/gpl.html>"
  echo "This is free software: you are free to change and redistribute it."
  echo "There is NO WARRANTY, to the extent permitted by law."
  echo
  echo "Written by Tommy Bennett."
  exit 1
}

# Create algorithm name array 
#
function create_name() {
  NAME[$NONMODIFYING]="fre:cnt:cni:mne:mxe:mme:fnd:fni:fin:fne:srh:srn:ffo:ajf:eql:ipr:msm:iss:isu:ipt:ppt:ihp:ihu:alo:ano:nno:lxc"
  NAME[$SORTING]="srt:sts:pst:psc:nth:ptn:spt:ptc:mkh:phh:pph:sth"
  NAME[$SORTEDRANGES]="bns::inc:lwb:upb:eqr:erl:mrg:stu:stn:std:ssd:ipm:ucp"
  NAME[$MODIFYING]="cpy:cpi:cpn:cpb:mov:mvb:tfm:mrg:swp:swr:fil:fln:gnr:gnn:rpl:rpi:rpc:rci:ita"
  NAME[$REMOVING]="rmv:rmi:rmc:rmf:uqe"
  NAME[$MUTATING]="rvr:rvc:rte:rtc:nxp:prp:shf"
  NAME[$NUMERIC]="acm:acl"
  NAME[$STRINGS]="ltr:trm:lwr:upr"
  NAME[$STREAMS]="sto:sti:oit"
  NAME[$IDIOMS]="erm"
  NAME[$CONTAINERS]="stm:stv"
}

# Create the expanded name array 
#
function create_expanded_name() {
  mnemonics=$(print_all)
  for n in $mnemonics
  do
    if [ -z "$name" ]; then             
      name=$n
      find_category $name
    else
      if [ -z "${EXPANDEDNAME[$index]}" ]; then
        EXPANDEDNAME[$index]="$name $n"
      else 
        EXPANDEDNAME[$index]="${EXPANDEDNAME[$index]}:$name $n"
      fi
      name=""
    fi
  done 
}

# Print category name 
#
function print_category() {
  case $1 in
    $NONMODIFYING ) echo "Nonmodifying" ;;
    $SORTING ) echo "Sorting" ;;
    $SORTEDRANGES ) echo "Sorted Ranges" ;;
    $MODIFYING ) echo "Modifying" ;;
    $REMOVING ) echo "Removing" ;;
    $MUTATING ) echo "Mutating" ;;
    $NUMERIC ) echo "Numeric" ;;
    $IDIOMS ) echo "Idioms" ;;
    $STRINGS ) echo "Strings" ;;
    $STREAMS ) echo "Streams" ;;
    $CONTAINERS ) echo "Containers" ;;
  esac
}

# Print all algorithm mnemonics
#
function print_all() {
  grep "n=" $ALGORITHM_MNEMONICS | awk -F'"' '{print $2" "$4}' | sort
}

# Print all algorithm mnemonics with category
#
function print_all_with_category() {
  local IFS=":" 
  end=${#NAME[@]}
  for (( i=0; i<end; i++ )) 
  do
    if [ $print_markdown -eq 1 ]; then
      echo -n "### "
    fi
    print_category $i
    echo
    for n in ${EXPANDEDNAME[$i]}
    do
      echo -n "$n" | tr " " "\t"
      echo "  "
    done
    echo
  done
}

# Find the algorithm category
#
function find_category() {
  local IFS=":" 
  end=${#NAME[@]}
  for (( i=0; i<end; i++ )) 
  do
    for n in ${NAME[$i]}
    do
      if [ "$1" == "$n" ]; then
        index=$i
        return 
      fi
    done 
  done
  echo "Error: $1 not found"
  exit 1
}

# Print algorithm mnemonics by category
#
function print_categories() {
  create_name
  create_expanded_name 
  print_all_with_category
}


################################################################################

print_categories=0
print_markdown=0

# Process long options
for option in "$@"; do
  case $option in
    "--version" ) version ;;
    "--help" ) usage ;;
  esac
done

# Process single-letter options
while getopts "cm" option; do
  case $option in
    c ) print_categories=1 ;; 
    m ) print_markdown=1 ;; 
    \? ) usage ;;
  esac
done
shift $((OPTIND - 1))

if [ $print_markdown -eq 1 ]; then
  echo "## STL Instruction Set"
fi

if [ $print_categories -eq 1 ]; then
  print_categories
else
  print_all 
fi

