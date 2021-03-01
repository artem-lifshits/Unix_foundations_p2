#!/bin/bash
read -p "Enter user name " USER_NAME
read -p "Enter User pwd " -s USER_PASS
sudo passwd ${USER_NAME} <<SCRIPT
${USER_PASS}
${USER_PASS}
SCRIPT
