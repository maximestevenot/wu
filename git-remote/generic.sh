#!/bin/bash

function git-remote-to-local() {
    local extracted_path="$(echo "$1" | sed 's#https://[^/]*/##; s#\.git$##')"
    echo "${SOURCES_FOLDER}/${extracted_path}"
}

function cr() {
    cd "$(git-remote-to-local "$1")" || exit
}

function gcr() {
    local local_repo
    local_repo=$(git-remote-to-local "$1")

    mkdir -p "$local_repo"
    git clone "$1" "$local_repo"
    cr "$1"
}
