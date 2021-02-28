#!/bin/bash
V_ARRAY=( $(cat list.dat) )
V_ARRAY=("${V_ARRAY[@]}" ${RANDOM})
unset V_ARRAY[0]
echo ${V_ARRAY[@]} > list.dat