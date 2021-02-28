#!/bin/bash
E_ILLEGAL_CALL=255

Max() {
  FILE_PATH="$1"

	if [ -z "$1" ] || [ ! -e "$1" ]; then
	  echo "Couldn't get the necessary data"
	  return ${E_ILLEGAL_CALL}
  fi
  LENGTH="$(wc -l < ${FILE_PATH})"
  FILE_NAME="$(basename ${FILE_PATH})"
  echo "File ${FILE_NAME} has ${LENGTH} strings"

}

# Пример вызова функции
Max
echo "Return code is $?"

Max materials/01_functions.sh
echo "Return code is $?"

Max non_existing_file.txt
echo "Return code is $?"