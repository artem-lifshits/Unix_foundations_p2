#!/bin/bash
DIR="${HOME}/UNIX_2_Data/logs"

for FILE in ${DIR}/*_{srv01,srv02,srv03}.{access,error}.log; do
  NAME="$(basename ${FILE})"
  NDIR="$( echo "${NAME}" | cut -d '_' -f 1)"
  FOLDER="$( echo "${NAME}" | cut -d '_' -f 2 | cut -d '.' -f 1 )"
  if [[ "${FILE}" == *"${FOLDER}"* ]]; then
    mkdir -p ${DIR}/${FOLDER}/${NDIR} 2>/dev/null
    mv ${FILE} ${DIR}/${FOLDER}/${NDIR}
  fi
done
