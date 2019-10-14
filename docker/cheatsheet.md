# cheatsheet

## Running a container

_docker run \<image\> \<some-command\> // Override the default startup command

_docker run -it \<image\> sh_ // Start a container with STDIN attached to sh

_docker create \<image\>_ // Create a container

_docker start \<container-id\>_ // Start a created container

_docker exec -it \<container-id\> \<some-command\>_ // execute an additional command inside a running container

## Stopping a container

_docker stop \<container-id\>_ // stop a container. Docker will send a SIGSTOP signal, if process doesn't respond will kill it

_docker kill \<container-id\>_ // kill the container process (SIGKILL)

## General

_docker ps_ // list running containers

_docker ps --all_ // all containers (ids, statuses etc)

_docker system prune_ // clean up (clean dangling build cache, remove stopped images etc)

_docker logs \<container-id\> // get all logs from a container
