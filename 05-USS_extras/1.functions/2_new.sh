#!/bin/bash
E_ILLEGAL_CALL=255

Max() {
  LENGTH="$(wc -l < $1)"
  return ${LENGTH}
}

Compare() {
  FILE_NAME=""
	if [ -z "$1" ] || [ -z "$2" ] || [ ! -e "$1" ] || [ ! -e "$2" ]; then
	  echo "Couldn't get the necessary data"
	  return ${E_ILLEGAL_CALL}
  fi

  Max $1
  LENGTH1=$?
  Max $2
  LENGTH2=$?

  V_RETURN="${LENGTH1}"
  FILE_PATH=$1

	if [[ ${LENGTH2} -gt ${LENGTH1} ]]; then
		V_RETURN="${LENGTH2}"
		FILE_PATH=$2
	fi

  FILE_NAME="$(basename ${FILE_PATH})"
  echo "File ${FILE_NAME} has ${V_RETURN} strings"

}

Compare 2.sh 1.sh
Compare 24124.sh 1.sh