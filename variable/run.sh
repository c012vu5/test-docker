#!/bin/sh

DOCKER_PATH=`which docker`
COMPOSE_PATH=`which docker-compose`
DOCKER=${DOCKER_PATH:-"podman"}
COMPOSE=${COMPOSE_PATH:-"podman-compose"}

sudo ${COMPOSE} up
sudo ${DOCKER} system prune -af
