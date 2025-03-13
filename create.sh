#!/bin/sh

DATA_FOLDER=./data
INIT_SCRIPT=./init.sql
CONTAINER_NAME=oracle-test
DATABASE_NAME=test
DATABASE_PASSWORD=test

mkdir -p ${DATA_FOLDER}
echo 'folder created'

sudo chown -R 54321:54321 ${DATA_FOLDER}
echo 'changed folder ownership'

docker run \
    --name ${CONTAINER_NAME} \
    --network host \
    -e ORACLE_SID=${DATABASE_NAME} \
    -e ORACLE_PWD=${DATABASE_PASSWORD} \
    -v ${DATA_FOLDER}:/opt/oracle/oradata \
    -v ${INIT_SCRIPT}:/opt/oracle/scripts/startup/init.sql \
    -d \
    doctorkirk/oracle-19c

docker logs -f "${CONTAINER_NAME}"
