#!/bin/bash

if [ ! -d "${HOME}/tmp" ]; then
		echo "Directory doesn't exist, creating..."
		mkdir "${HOME}/tmp"
fi

DIR="${HOME}/tmp"
FILE="${DIR}/.application.lock"

if [ -e "${FILE}" ]; then
		echo "Concurrent execution detected"
		exit 1
else
		touch ${FILE}
		sleep 20
fi

rm "${FILE}"