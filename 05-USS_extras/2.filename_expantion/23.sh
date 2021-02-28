#!/bin/bash
set +f
DIR=${PWD}

shopt -s failglob

ls ${DIR}/*.config > /dev/null

if [ "$?" -eq 1 ]; then
  echo "Error: no config files found"
  exit 1
fi

for V_FILE in ${DIR}/*.config; do
  FILE_NAME="$(basename ${V_FILE})"
  echo "applying the config file: ${FILE_NAME}"
  source ${V_FILE}
done


