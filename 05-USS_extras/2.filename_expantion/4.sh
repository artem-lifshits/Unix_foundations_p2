#!/bin/bash
E_ILLEGAL_CALL=255

Max() {
  declare -a MY_ARRAY
  for V_FILE in /home/ubuntu/unix_branch/02-USS_variables/1.assign_and_sub/*.sh; do
    MY_ARRAY=("${V_FILE}" "${MY_ARRAY[@]}")
  done
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

Max

