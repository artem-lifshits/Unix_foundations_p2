#!/bin/bash

if [ ! -d "${HOME}/tmp" ]; then
	echo "Directory doesn't exist, creating..."
	mkdir "${HOME}/tmp"
fi

DIR="${HOME}/tmp"
FILE="${DIR}/.application.lock"

if [ -s "${FILE}" ]; then
  LAST_PID="$(cat ${FILE})"
  echo "Last PID is: ${LAST_PID}"
fi

if [ -e /proc/${LAST_PID} -a /proc/${LAST_PID}/exe ]; then
  echo "Proccess is still running, please try again later"
  exit 0
elif [ -s "${FILE}" ]; then
  echo "Last proccess was interrupted, clearing lock file..."
  rm ${FILE}
fi

if [ -e "${FILE}" ]; then
	echo "Concurrent execution detected"
	exit 1
else
	touch ${FILE}
	sleep 20 &
	PID=$!
	echo $PID > ${FILE}
	echo "PID IS ${PID}"
	wait $PID
fi

rm "${FILE}"