# dockoracle

Resources to deploy an oracle container with a default user `sherlock`. This configuration is meant to be use for local development, where access rights are not very relevant.

The base docker image is [doctorkirk/oracle-19c](https://hub.docker.com/r/doctorkirk/oracle-19c).

## First-time use

> sh create.sh

This will create the data folder, change its access rights and start the container.

After several minutes the container is on should be on an idle state and this message is deplayed:

> #########################
> DATABASE IS READY TO USE!
> #########################

## Open interactive console

Open the sqlplus interactive console with user `sherlock`:

> docker exec -it oracle-test sqlplus sherlock/holmes@test

with user `sys`:

> docker exec -it oracle-test sqlplus sys/test@test AS SYSDBA

## Deep clean

If by any reason you need to erase the container and all data, run the `delete.sh` script. It will:
- stop the docker container;
- remove the docker container;
- delete the contents of the data folder (requires root privileges).