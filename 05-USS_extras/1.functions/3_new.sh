#!/bin/bash
E_ILLEGAL_CALL=255

Max() {
  LENGTH="$(wc -l < $1)"
  return ${LENGTH}
}

Compare() {
  FILE_NAME=""

  Max $1
  LENGTH1=$?
  Max $2
  LENGTH2=$?

  V_RETURN="${LENGTH1}"
  FILE_PATH=$1

	if [[ ${LENGTH2} -gt ${LENGTH1} ]]; then
		V_RETURN="${LENGTH2}"
		FILE_PATH="$2"
	fi
  LENGTH=${V_RETURN}
  MAX=${FILE_PATH}
}

Compare_all() {
  MY_ARRAY=( "$@" )

  MAX=${MY_ARRAY[0]}
  EN=${#MY_ARRAY[@]}
  for V_INT in $(seq 1 ${EN}); do
    Compare "${MAX}" "${MY_ARRAY[${V_INT}]}"
  done

  FILE_NAME="$(basename ${MAX})"
  echo "The longest file is: ${MAX} (${LENGTH} line(s))"

}

Compare_all materials/files_to_compare/1 materials/files_to_compare/1 materials/files_to_compare/6 materials/files_to_compare/3 materials/files_to_compare/3
echo "Return code is $?"
echo "${FILE_NAME}"

Compare_all materials/files_to_compare/4 materials/files_to_compare/1 materials/files_to_compare/2 materials/files_to_compare/3 materials/files_to_compare/5
echo "Return code is $?"
echo "${FILE_NAME}"
