#!/bin/sh

CONTAINER_NAME=oracle-cis

docker stop ${CONTAINER_NAME}
docker rm ${CONTAINER_NAME}
sudo rm -rf data/*
