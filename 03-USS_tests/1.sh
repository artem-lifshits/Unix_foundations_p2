#!/bin/bash

sleep $RANDOM &
PROC1=$!
sleep $RANDOM &
PROC2=$!
sleep 15
if ps ${PROC1} &> /dev/null; then
		echo "Job PID=${PROC1} is still running, terminating..."
		kill -9 ${PROC1}
else
		echo "Job PID=${PROC1} is finished"
fi
if ps ${PROC2} &> /dev/null; then
		echo "Job PID=${PROC2} is still running, terminating..."
		kill -9 ${PROC2}
else
		echo "Job PID=${PROC2} is finished"
fi