#!/bin/bash
V_ARRAY=( $(cat elements.txt) )
V_ARRAY=("${RANDOM}" "${V_ARRAY[@]}")
unset V_ARRAY[-1]
echo ${V_ARRAY[@]} > list.dat