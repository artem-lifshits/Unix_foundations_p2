#!/bin/bash

DIR="${HOME}/env"
mkdir ${DIR}
for ITER in ${DIR}/{DEV,TEST,DEMO,PROD}; do
  mkdir ${ITER}
done

for ITER in ${DIR}/{DEV,TEST,DEMO,PROD}/{app,data,test,config}; do
  mkdir ${ITER}
done

for ITER in ${DIR}/{DEV,TEST,DEMO,PROD}/config/{preview,live}; do
  mkdir ${ITER}
done

#Вариант с использованием функции
#check_folder() {
#
#  if [ -d "$1" ]; then
#    echo "Folder $1 already exist"
#    return 0
#  else
#    mkdir "$1"
#    echo "Folder $1 created"
#  fi
#}
#MY_ARRAY=( DEV TEST DEMO PROD)
#DIR="${HOME}/env"
#check_folder ${DIR}
#V_ARRAY=( )
#for ITER in ${MY_ARRAY[@]}; do
#  check_folder ${DIR}/${ITER}
#  V_ARRAY=( "${DIR}/${ITER}" "${V_ARRAY[@]}")
#done
#
#CONFIG_ARRAY=( )
#
#for ITER in ${V_ARRAY[@]}; do
#  check_folder ${ITER}/app
#  check_folder ${ITER}/config
#  CONFIG_ARRAY=( "${ITER}/config" "${CONFIG_ARRAY[@]}" )
#  check_folder ${ITER}/data
#  check_folder ${ITER}/test
#done
#
#echo ${V_ARRAY[@]}
#echo ${CONFIG_ARRAY[@]}
#
#for ITER in ${CONFIG_ARRAY[@]}; do
#  check_folder ${ITER}/preview
#  check_folder ${ITER}/live
#done
