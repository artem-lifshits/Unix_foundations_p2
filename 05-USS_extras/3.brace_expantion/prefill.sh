#!/bin/bash

for V_INST in srv{01,02,03}; do

    V_INST_LOG_DIR="${HOME}/UNIX_2_Data/logs"

    mkdir -pv "${V_INST_LOG_DIR}"
    pushd "${V_INST_LOG_DIR}"

    touch 202005{01..10}{07..18}_${V_INST}.{access,error}.log

    popd
done