#!/bin/bash
E_ILLEGAL_CALL=255

Max() {
  MY_ARRAY=( "$@" )
  FILE_NAME=""

  if [ -z "${MY_ARRAY[0]}" ] || [ -z "${MY_ARRAY[0]}" ] || [ "${#MY_ARRAY[@]}" -eq "0" ]; then
	  echo "Couldn't get the necessary data"
	  return ${E_ILLEGAL_CALL}
  fi

  FILE_PATH="${MY_ARRAY[0]}"
  LENGTH="$(wc -l < ${FILE_PATH})"

  while [ "${#MY_ARRAY[@]}" -gt "1" ]; do

    FILE_PATH1="${MY_ARRAY[1]}"

    if [ -z "${FILE_PATH1}" ] || [ ! -e "${FILE_PATH1}" ]; then
      echo "Couldn't get the necessary data"
      return ${E_ILLEGAL_CALL}
    fi

    LENGTH1="$(wc -l < ${FILE_PATH1})"

    if [[ ${LENGTH1} -gt ${LENGTH} ]]; then
      LENGTH="${LENGTH1}"
      FILE_PATH="${FILE_PATH1}"
    fi
    MY_ARRAY=("${MY_ARRAY[@]:1}")

  done

  FILE_NAME="$(basename ${FILE_PATH})"
  echo "The longest file is: ${FILE_NAME} (${LENGTH} line(s))"

}

Max materials/files_to_compare/1 materials/files_to_compare/1 materials/files_to_compare/6 materials/files_to_compare/3 materials/files_to_compare/3
echo "Return code is $?"
echo "${FILE_NAME}"

Max materials/files_to_compare/4 materials/files_to_compare/1 materials/files_to_compare/2 materials/files_to_compare/3 materials/files_to_compare/5
echo "Return code is $?"
echo "${FILE_NAME}"
