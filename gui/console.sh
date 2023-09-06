#!/bin/sh

ARG_NUM=$#
ARG1=$1
ARG2=$2
IMG=`basename $(dirname $(readlink -f "$0"))`

DOCKER_PATH=$(which docker)
COMPOSE_PATH=$(which docker-compose)
DOCKER=${DOCKER_PATH:-"podman"}
COMPOSE=${COMPOSE_PATH:-"podman-compose"}

function main() {
    if [ ! -e .env ]; then
        prepare
    fi

    case ${ARG1} in
        "container" )
            container
            ;;
        * )
            global_error
            ;;
    esac
}

function prepare() {
    echo "### compose.yml .env file." > .env
    echo "### This file was created by console.sh" >> .env
    echo "### to enable the sharing of uid and gid between the host and container." >> .env
    echo "### And set the specified volume location." >> .env
    echo "UID=`id -u`" >> .env
    echo "GID=`id -g`" >> .env
    echo "USER=`whoami`" >> .env
    echo "VOL=" >> .env

    global_error
}

function container() {
    case ${ARG2} in
        "up" )
            sudo ${COMPOSE} up -d
            ;;
        "down" )
            sudo ${COMPOSE} down
            ;;
        "clean" )
            sudo ${DOCKER} system prune -af
            ;;
        "enter" )
            sudo ${DOCKER} exec -it ${IMG} /bin/sh
            ;;
        * )
            container_error
            ;;
    esac
}

function global_error() {
    echo -e "Available Commands:\n"
    container_error
}

function container_error() {
    echo -e "\033[32m./console.sh container\033[m [up|down|clean|enter]"
    echo "Description: control container."
    echo "Options:"
    echo "  up         build and run container."
    echo "  down       stop and rm container."
    echo "  clean      clean unused images, containers, unnamed volumes and networks."
    echo "  enter      enter container."
    echo
}

main
