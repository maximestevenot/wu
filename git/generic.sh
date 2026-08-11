#!/bin/bash

function git-remote-to-local() {
    local extracted_path
    extracted_path="$(echo "$1" | sed 's#https://[^/]*/##; s#\.git$##')"
    echo "${SOURCES_FOLDER}/${extracted_path}"
}

function cr() {
    cd "$(git-remote-to-local "$1")" || exit
}

function gcr() {
    local repo_url="$1"
    local local_repo
    if [[ ! "$repo_url" =~ \.git$ ]]; then
        repo_url="${repo_url}.git"
    fi
    local_repo=$(git-remote-to-local "$repo_url")
    mkdir -p "$local_repo"
    git clone "$repo_url" "$local_repo"
    cd "$local_repo" || exit
}
