#!/bin/bash

NUMBER='^[0-9]+$'
TIME1=10
TIME2=20
JOBS=3

while [ -n "$1" ]; do
	case $1 in
		"-t")
			if ! (( $2 > 0 )) ; then
   				echo "Input is not a number"
				  exit 1
			elif [ $2 -le 0 ]; then
			    echo "Input is not a correct number"
			    exit 1
			else
			  TIME1=$2
			fi
			shift
			shift
			;;
		"-j")
			if ! (( $2 > 0 )) ; then
            echo "Input is not a number"
            exit 1
      elif [ $2 -le 0 ]; then
          echo "Input is not a correct number"
          exit 1
      else
        JOBS=$2
      fi
			shift
			shift
			;;
		"-h")
			tee <<EOF
The watchdog script

Usage: $0 [-t INTERVAL] [-j JOBS]

JOBS:      amount of background jobs started
EOF
			exit 0
			;;

		*)
			echo "Wrong input"
			exit 1
	esac
done

V_ARRAY=( )

# дополнительный процессс с заданным временем для тестов
#sleep $TIME2 &
#PID1=$!
#echo "Job [ $PID1 ] is sleeping for $TIME2 second(s)"
#
#V_ARRAY=( $PID1 )

for V_ITER in $(seq $JOBS); do
	TIME=$RANDOM
	sleep $TIME &
	PID2=$!
	echo "Job [ $PID2 ] is sleeping for $TIME second(s)"
	V_ARRAY=( "$PID2" "${V_ARRAY[@]}" )
done

echo ${V_ARRAY[@]}

while "true"; do
  echo "Sleeping for ${TIME1} sec"
	sleep $TIME1
	for PID in ${V_ARRAY[@]}; do
		if ! ps $PID > /dev/null; then
			echo "Job $PID was finished"
			break 2
		fi
	done
done

V_ARRAY=( "${V_ARRAY[@]/$FINISHED}" )
echo ${V_ARRAY[@]}

for PROCESS in ${V_ARRAY[@]}; do
	echo "Shutting down the job [ $PROCESS ]..."
	kill -9 ${PROCESS}
done