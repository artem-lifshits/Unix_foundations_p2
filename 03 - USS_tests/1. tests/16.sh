#!/bin/bash

if [ -n "$*" ]; then
	V_USERNAME=$*
else
	read -p "What is your name?: " V_USERNAME
fi

if [ -z "${V_USERNAME}" ]; then
	V_USERNAME=${USER}
fi

declare -i V_LOG=$(cut -d ':' -f 1 /etc/passwd | grep -c '^'"${V_USERNAME}"'$')

if test "${V_LOG}" == "0"; then
	echo "Error: username doesn't exist"
	exit 1
fi

echo "Your name is ${V_USERNAME}"

if [ "${V_USERNAME}" = "${USER}" ]; then
	passwd ${PASSW}
else
	sudo passwd $V_USERNAME
fi
