#!/bin/bash

FILE=$1
EMAIL=$2
NAME="$(basename ${FILE})"

if [ ! -e "${FILE}" ] || [ ! -r "${FILE}" ] || [ -d "${FILE}" ]; then
		exit 100
fi

FILE_SIZE=$(wc -c <"$FILE")

if [ "${FILE_SIZE}" -gt "52428800" ]; then
		exit 101
elif [ "${FILE_SIZE}" -le "5242880" ]; then
		mail -a ${FILE} -s "${NAME}" $2 < /dev/null
		exit 0
fi

if [ ! -e /tmp/${NAME}.tar.gz ]; then
			tar -czvf /tmp/${NAME}.tar.gz ${FILE}
else
		echo "File already exist"
		exit 1
fi

ARCHIVE_SIZE=$(wc -c </tmp/${NAME}.tar.gz)
if [ "${ARCHIVE_SIZE}" -gt "5242880" ]; then
		exit 102
else
		mail -a /tmp/${NAME}.tar.gz -s "${NAME}" $2 < /dev/null
fi