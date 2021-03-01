#!/bin/bash
E_ILLEGAL_CALL=255

Max() {
  FILE_NAME=""

	if [ -z "$1" ] || [ -z "$2" ] || [ ! -e "$1" ] || [ ! -e "$2" ]; then
	  echo "Couldn't get the necessary data"
	  return ${E_ILLEGAL_CALL}
  fi

  FILE_PATH1="$1"
  FILE_PATH2="$2"

  LENGTH1="$(wc -l < ${FILE_PATH1})"
  LENGTH2="$(wc -l < ${FILE_PATH2})"

  V_RETURN="${LENGTH1}"
  FILE_PATH="${FILE_PATH1}"

	if [[ ${LENGTH2} -gt ${LENGTH1} ]]; then
		V_RETURN="${LENGTH2}"
		FILE_PATH="${FILE_PATH2}"
	fi

  FILE_NAME="$(basename ${FILE_PATH})"
  echo "File ${FILE_NAME} has ${V_RETURN} strings"

}

# Пример вызова функции
Max materials/01_functions.sh 19.sh
echo "Return code is $?"
echo "${FILE_NAME}"

Max materials/01_functions.sh
echo "Return code is $?"
echo "${FILE_NAME}"

Max materials/01_functions.sh 20.sh
echo "Return code is $?"
echo "${FILE_NAME}"

Max 20.sh nonexisting_file.txt
echo "Return code is $?"
echo "${FILE_NAME}"