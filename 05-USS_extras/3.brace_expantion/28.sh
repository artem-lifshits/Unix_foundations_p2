#!/bin/bash
DIR="${HOME}/UNIX_2_Data/logs"
echo ${DIR}
mkdir ${DIR}/{srv01,srv02,srv03} 2>/dev/null
for FILE in ${DIR}/*_{srv01,srv02,srv03}.{access,error}.log; do
  NAME="$(basename ${FILE})"
  NDIR="$( echo "${NAME}" | cut -d '_' -f 1)"
  if [[ "${FILE}" == *"srv01"* ]]; then
    mkdir ${DIR}/srv01/${NDIR} 2>/dev/null
    cp ${FILE} ${DIR}/srv01/${NDIR}
    rm ${FILE}
  elif [ "${FILE}" == *"srv02"* ]; then
    mkdir ${DIR}/srv02/${NDIR} 2>/dev/null
    cp ${FILE} ${DIR}/srv02/${NDIR}
    rm ${FILE}
  else
    mkdir ${DIR}/srv01/${NDIR} 2>/dev/null
    cp ${FILE} ${DIR}/srv03/${NDIR}
    rm ${FILE}
  fi
done
