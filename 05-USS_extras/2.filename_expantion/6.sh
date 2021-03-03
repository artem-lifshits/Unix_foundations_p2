#!/bin/bash
set +f
DIR=${PWD}
DIR2=${HOME}/.globbing

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

shopt -u failglob
shopt -s nullglob

if [ ! -n "$(echo ${DIR2}/*config)" ]; then
  echo "INFO: no user-specifig config files found"
  exit 0
fi

for V_FILE in ${DIR2}/*.config; do
  FILE_NAME="$(basename ${V_FILE})"
  echo "Applying user-specific config: ${FILE_NAME}"
  source ${V_FILE}
done
