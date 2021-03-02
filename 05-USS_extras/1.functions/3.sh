#!/bin/bash
E_ILLEGAL_CALL=255

Max() {
	if [ -z "$1" ] || [ ! -e "$1" ]; then
	  CHECK="fail"
	  return ${E_ILLEGAL_CALL}
  fi
  LENGTH="$(wc -l < $1)"
}

Compare() {

  Max $1
  LENGTH1=${LENGTH}

  Max $2
  LENGTH2=${LENGTH}

  if [ "${CHECK}" == "fail" ]; then
    return ${E_ILLEGAL_CALL}
  fi

  MAXIMUM="${LENGTH1}"
  FILE_PATH=$1

	if [[ ${LENGTH2} -gt ${LENGTH1} ]]; then
		MAXIMUM="${LENGTH2}"
		FILE_PATH=$2
	fi
}

Compare_all() {
  CHECK='true'
  MY_ARRAY=( "$@" )
  MAX_NAME=${MY_ARRAY[0]}
  unset MY_ARRAY[0]
  EN=${#MY_ARRAY[@]}
  for V_INT in $(seq 1 ${EN}); do
    Compare "${MAX_NAME}" "${MY_ARRAY[${V_INT}]}"
    MAX_NAME="${FILE_PATH}"
    MAX_LENGTH="${MAXIMUM}"
  done

  if [ "${CHECK}" == "fail" ]; then
    echo "Some file doesn't exist"
    return ${E_ILLEGAL_CALL}
  fi

  FILE_NAME="$(basename ${MAX_NAME})"
  echo "The longest file is: ${FILE_NAME} (${MAX_LENGTH} line(s))"

}

Compare_all materials/files_to_compare/1 materials/files_to_compare/1 materials/files_to_compare/6 materials/files_to_compare/3 materials/files_to_compare/3

Compare_all materials/files_to_compare/4 materials/files_to_compare/1 materials/files_to_compare/3 materials/files_to_compare/5 nonexistent

Compare_all materials/files_to_compare/4 materials/files_to_compare/1 materials/files_to_compare/2 materials/files_to_compare/3 materials/files_to_compare/5

Compare_all materials/files_to_compare/4 materials/files_to_compare/1 materials/files_to_compare/2 materials/files_to_compare/3 materials/files_to_compare/5 nonexistent
