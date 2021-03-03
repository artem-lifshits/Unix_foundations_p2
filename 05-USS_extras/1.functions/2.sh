#!/bin/bash
E_ILLEGAL_CALL=255

source 1.sh

Compare() {
  FILE_NAME=""

  Max $1
  LENGTH1=${LENGTH}
  Max $2
  LENGTH2=${LENGTH}
  if [ "${CHECK}" == "fail" ]; then
    return ${E_ILLEGAL_CALL}
  fi

  MAX="${LENGTH1}"
  FILE_PATH=$1

	if [[ ${LENGTH2} -gt ${LENGTH1} ]]; then
		MAX="${LENGTH2}"
		FILE_PATH=$2
	fi

  FILE_NAME="$(basename ${FILE_PATH})"
  #echo "File ${FILE_NAME} has ${MAX} strings"

}

Compare 2.sh 1.sh

Compare 24124.sh 1.sh