#!/bin/bash
for V_KEY in ${!V_CONVERSATION[@]}; do
echo "${V_KEY}: ${V_CONVERSATION[$V_KEY]}"
done
