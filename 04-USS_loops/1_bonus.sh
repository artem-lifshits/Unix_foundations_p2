#!/bin/bash

ARRAY=( d default t timedout f failed )

while [[ $# -gt 1 ]]; do
	case "$1" in
		"-s")
		  shift
			if [ "$1" == "${ARRAY[0]}" ] || [ "$1" == "${ARRAY[1]}" ]; then
				echo "Using sorting mode: default"
				exit 0
			elif [ "$2" == "${ARRAY[2]}" ] || [ "$1" == "${ARRAY[3]}" ]; then
				echo "Using sorting mode: timedout"
				exit 0
			elif [ "$1" == "${ARRAY[4]}" ] || [ "$1" == "${ARRAY[5]}" ]; then
				echo "Using sorting mode: failed"
				exit 0
			else
				echo "An invalid value provided: $1"
			fi
			;;
		*)
			shift
			;;
	esac
done

echo "Enter the sorting mode:"
echo "        (${ARRAY[0]})${ARRAY[1]}"
echo "        (${ARRAY[2]})${ARRAY[3]}"
echo "        (${ARRAY[4]})${ARRAY[5]}"


for TRY in {1..3}; do
	read -p ""
	case "${REPLY}" in
		"${ARRAY[0]}" | "${ARRAY[1]}")
			echo "Using sorting mode: default"
			exit 0
			;;
		"${ARRAY[2]}" | "${ARRAY[3]}")
			echo "Using sorting mode: timedout"
			exit 0
			;;
		"${ARRAY[4]}" | "${ARRAY[5]}")
			echo "Using sorting mode: failed"
			exit 0
			;;
		*)
		  echo "Input is not recognized"
			;;
	esac
done

echo "Setting default sorting mode"
exit 0