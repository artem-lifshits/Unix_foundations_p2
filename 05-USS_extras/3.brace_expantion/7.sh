#!/bin/bash

DIR="${HOME}/env"

for ITER in ${DIR}/{DEV,TEST,DEMO,PROD}/{app,data,test,config/{preview,live}}; do
  mkdir -p ${ITER}
done
