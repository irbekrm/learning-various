# cheatsheet

## Running a container

_docker run \<image\> \<some-command\>_ // Override the default startup command

_docker run -it \<image\> sh_ // Start a container with STDIN attached to sh

_docker run \<host-port\>:\<container-port\> \<image\>_ // Port mapping. Allow ingress traffic into container (from host port to container port)

_docker create \<image\>_ // Create a container (places fs snapshot on the section of hard drive allocated)

_docker start \<container-id\>_ // Start a created container (runs the startup command)

_docker exec -it \<container-id\> \<some-command\>_ // execute an additional command inside a running container

## Stopping a container

_docker stop \<container-id\>_ // stop a container. Docker will send a SIGSTOP signal, if process doesn't respond will kill it

_docker kill \<container-id\>_ // kill the container process (SIGKILL)

## Building an image

_docker build \<path-to-build-context\>_ // Build an image from a Dockerfile

_docker build \<dockerhub-id\>/\<project-name\>:<tag>_ // Tag an image. Default tag is 'latest'
  
_docker commit -c 'CMD ["\<startup-command\>"] \<container-id\>_ // Manually create an image from a running container

## General

_docker ps_ // list running containers

_docker ps --all_ // all containers (ids, statuses etc)

_docker system prune_ // clean up (clean dangling build cache, remove stopped images etc)

_docker logs \<container-id\>_ // get all logs from a container
