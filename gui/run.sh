#!/bin/sh

DOCKER_PATH=`which docker`
COMPOSE_PATH=`which docker-compose`
DOCKER=${DOCKER_PATH:-"podman"}
COMPOSE=${COMPOSE_PATH:-"podman-compose"}

echo -n CT_HOME= > .env
echo ~ >> .env

sudo ${COMPOSE} up
sudo ${DOCKER} system prune -af
