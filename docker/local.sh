#!/bin/bash

function docker-cleanup() {
    docker stop "$(docker ps -aq)"
    docker rm "$(docker ps -aq)"
    docker rmi "$(docker images -q)"
}

function docker-transfer() {
    local image_name=$1
    local image_version=$2
    local source_repo=$3
    local target_repo=$4

    docker pull "${source_repo}/${image_name}:${image_version}"
    docker tag "${source_repo}/${image_name}:${image_version}" "${target_repo}/${image_name}:${image_version}"
    docker push "${target_repo}/${image_name}:${image_version}"
}
