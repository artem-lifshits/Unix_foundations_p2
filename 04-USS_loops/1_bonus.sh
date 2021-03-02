#!/bin/bash

declare -A ARRAY
ARRAY[d]=default
ARRAY[t]=timedout
ARRAY[f]=failed

for KEY in "${!ARRAY[@]}"; do
  if [ "${KEY}" == "$2" ] || [ "${ARRAY[$KEY]}" == "$2" ]; then
    CHECK="true"
  fi
  if [ "${CHECK}" == "true" ] && [ "$1" == "-s" ]; then
    echo "Using sorting mode: ${ARRAY[$KEY]}"
    exit 0
  fi
  CHECK="false"
done

echo "Enter the sorting mode:"
for KEY in "${!ARRAY[@]}"; do
  echo "        (${KEY})${ARRAY[$KEY]}"
done

for TRY in {1..3}; do
  read -p ""
  for KEY in "${!ARRAY[@]}"; do
    if [ "${KEY}" == "${REPLY}" ] || [ "${ARRAY[$KEY]}" == "${REPLY}" ]; then
      echo "Using sorting mode: ${ARRAY[$KEY]}"
      exit 0
    fi
  done
  echo "Input is not recognized"
done

echo "Setting default sorting mode"
exit 0