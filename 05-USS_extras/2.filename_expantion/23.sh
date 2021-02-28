#!/bin/bash
set +f
DIR=${PWD}
declare -a MY_ARRAY

shopt -s failglob

ls ${DIR}/*.config

if [ ! $? ]; then
  echo "Error: no config files found"
  exit 1
fi

#for V_FILE in ${DIR}/*.config; do
#  MY_ARRAY=("${V_FILE}" "${MY_ARRAY[@]}")
#done
#
#echo ${#MY_ARRAY[@]}
#echo ${MY_ARRAY[@]}

#shopt –s nullglob


