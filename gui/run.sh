#!/bin/sh

DOCKER_PATH=`which docker`
COMPOSE_PATH=`which docker-compose`
DOCKER=${DOCKER_PATH:-"podman"}
COMPOSE=${COMPOSE_PATH:-"podman-compose"}

### works correctly
sudo ${DOCKER} build -t gui -f Dockerfile .
sudo ${DOCKER} run --rm -it --net host -e DISPLAY=${DISPLAY} -v ${HOME}/.Xauthority:/root/.Xauthority:ro --entrypoint "/usr/bin/xeyes" gui

### compose not working
# sudo ${COMPOSE} up
# sudo ${COMPOSE} down

### CLEAN
sudo ${DOCKER} system prune -af
