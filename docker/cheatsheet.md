# cheatsheet

## Running a container

_docker run \<image\> \<some-command\>_ // Override the default startup command

_docker run -it \<image\> sh_ // Start a container with STDIN attached to sh

_docker run -d \<image\>_ // Run container in the background

_docker run -p \<host-port\>:\<container-port\> \<image\>_ // Port mapping. Allow ingress traffic into container (from host port to container port)

_docker run -v \<host-path\>:\<container-path\> \<image\>_ // Use Docker volumes. Instead of copying files at \<host-path\>
to the container, will pass a reference to them. If the files are changed whilst the container is running, the container
will see the updated version

_docker -v \<path-to-files-generated-whilst-building-image\> -v \<host-path\>:\<container-path\> \<image\>_ // Use Docker volumes, but bookmark path to some files inside \<container-path\> that are to be generated whilst building an image and not
to be mapped to files from local machine. Without bookmarking any path from \<container-path\> will be attempted to be looked up from the external volume

_docker create \<image\>_ // Create a container (places fs snapshot on the section of hard drive allocated)

_docker start \<container-id\>_ // Start a created container (runs the startup command)

_docker exec -it \<container-id\> \<some-command\>_ // execute an additional command inside a running container

## Stopping a container

_docker stop \<container-id\>_ // stop a container. Docker will send a SIGSTOP signal, if process doesn't respond will kill it

_docker kill \<container-id\>_ // kill the container process (SIGKILL)

## Building an image

_docker build \<path-to-build-context\>_ // Build an image from a Dockerfile

_docker build -f \<Dockerfile-name\> \<path-to-build-context\>_ // Differently named Dockerfile 

_docker build \<dockerhub-id\>/\<project-name\>:<tag> \<path-to-build-context\>_ // Tag an image. Default tag is 'latest'
  
_docker commit -c 'CMD ["\<startup-command\>"] \<container-id\>_ // Manually create an image from a running container

## General

_docker ps_ // list running containers

_docker ps --all_ // all containers (ids, statuses etc)

_docker system prune_ // clean up (clean dangling build cache, remove stopped images etc)

_docker logs \<container-id\>_ // get all logs from a container

## Docker Compose

_docker-compose up_ // Will run the containers specified in docker-compose.yml and build if images don't exist

_docker-compose up --build_ // Will re-build images and run containers for services specified in docker-compose.yml

_docker-compose up -d_ // Start in the background

_docker-compose down_ // Stop and remove containers

_docker-compose ps_ // List running containers
