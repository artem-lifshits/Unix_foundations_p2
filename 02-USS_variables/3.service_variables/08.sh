#!/bin/bash
TIME=$RANDOM
sleep $TIME &
echo "Job $!, waiting for $TIME sec. is triggered from $$"
JOB1=$!
TIME=$RANDOM
sleep $TIME &
echo "Job $!, waiting for $TIME sec. is triggered from $$"
JOB2=$!
TIME=$RANDOM
sleep $TIME &
echo "Job $!, waiting for $TIME sec. is triggered from $$"
JOB3=$!
sleep 15
kill -9 ${JOB1}
kill -9 ${JOB2}
kill -9 ${JOB3}