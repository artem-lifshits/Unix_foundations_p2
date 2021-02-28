#!/bin/bash

while [[ $# -gt 1 ]]; do
	case "$1" in
		"-s")
		  shift
			if [ "$1" == "default" ] || [ "$1" == "d" ]; then
				echo "Using sorting mode: default"
				exit 0
			elif [ "$2" == "timedout" ] || [ "$1" == "t" ]; then
				echo "Using sorting mode: timedout"
				exit 0
			elif [ "$1" == "failed" ] || [ "$1" == "f" ]; then
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
echo "        (d)default"
echo "        (f)failed"
echo "        (t)timedout"


for TRY in {1..3}; do
	read -p ""
	case "${REPLY}" in
		"d" | "default")
			echo "Using sorting mode: default"
			exit 0
			;;
		"t" | "timedout")
			echo "Using sorting mode: timedout"
			exit 0
			;;
		"f" | "failed")
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