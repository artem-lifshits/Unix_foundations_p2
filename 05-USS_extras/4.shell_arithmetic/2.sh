#!/bin/bash

CHECK="test"
MIN=''
MAX=''
ARRAY=()

check_int(){
  if [[ $(($1)) != $1 ]];then
      echo "Not a number!"
      exit 0
  fi
}

sort_bubble(){
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
    CHECK=${REPLY}
    echo "Array sorted:   ${ARRAY[@]}"
  done
else
  for INT in $@; do
    check_int ${INT}
    sort_bubble ${INT}
  done
fi

echo "Array sorted:   ${ARRAY[@]}"