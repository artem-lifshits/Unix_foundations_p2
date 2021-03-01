#!/bin/bash

for FILE in {base,user,ftp,reporting}.config; do
  if [ ! -e ${FILE} ]; then
    echo "***ERROR: cannot read file ${FILE}"
    exit 1
  fi
  echo "Config file found: ${FILE}, reading..."
done