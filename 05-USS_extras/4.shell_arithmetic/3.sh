#!/bin/bash

CHECK="test"
REV=0
INT=false
MIN=''
MAX=''

check_int(){
  if [ "$1" == "-r" ] || [ "$1" == "--rev" ]; then
    ((REV ^= 1))
    INT='false'
    return 0
  elif [[ $(($1)) != $1 ]];then
      echo "Not a number!"
      exit 0
  else
    INT='true'
  fi
}

sort_bubble(){
  if [ "${INT}" == "false" ]; then
    return 0
  fi
  for INT in $@; do
    ARRAY=("$INT" ${ARRAY[@]})
  done
  LEN=${#ARRAY[@]}
    for ((I = 0; I<LEN; I++)); do
      for ((J = 0; J<LEN-I-1; J++)); do
        if [ ${ARRAY[J]} -gt ${ARRAY[$((J+1))]} ];then
          MAX=${ARRAY[J]}
          ARRAY[$J]=${ARRAY[$((J+1))]}
          ARRAY[$((J+1))]=$MAX
        fi
      done
    done
}

print_func(){
    if [ ${REV} -eq "1" ];then
      for ((I=0; I<LEN; I++)); do
        REVERT=("${ARRAY[$I]}" ${REVERT[@]})
      done
      echo "Array sorted:   ${REVERT[@]}"
      REVERT=()
    else
      echo "Array sorted:   ${ARRAY[@]}"
    fi
}


if [ -z "$1" ]; then
  #no arguments - invite for user input
  echo "Enter the values one by one, type an empty string to break"
  while [ ! -z "${CHECK}" ]; do
    read -p ""
    if [[ ${REPLY} = ' ' ]] || [[ ${REPLY} = '' ]]; then
      break
    fi
    check_int ${REPLY}
    sort_bubble ${REPLY}
    print_func
  done
else
  for GER in $@; do
    check_int ${GER}
    sort_bubble ${GER}
  done
fi

print_func