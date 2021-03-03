#!/bin/bash

CHECK="test"
MIN=''
MAX=''

minmax(){
  if [[ $1 = '' ]]; then
    return 0
  elif [[ $(($1)) != $1 ]];then
    echo "Not a number!"
    return 0
  fi

  if (($1 < MIN)) || [ "$MIN" == '' ]; then
    MIN=$1
  fi
  if ((MAX <= $1)); then
    MAX=$1
  fi
}

if [ -z "$1" ]; then
  #no arguments - invite for user input
  echo "Enter the values one by one, type an empty string to break"
  while [ ! -z "${CHECK}" ]; do
    read -p ""
    minmax ${REPLY}
    CHECK=${REPLY}
    echo "MIN:  ${MIN};  MAX:  ${MAX}"
  done
  echo "MIN:  ${MIN};  MAX:  ${MAX}"
else
  for INT in $@; do
    minmax ${INT}
  done
  echo "MIN:  ${MIN};  MAX:  ${MAX}"
fi

