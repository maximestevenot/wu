#!/bin/bash

function randgen() {
    # $1: The type of random you want to generate
    # $2: The length of the generated string

    function _generate_random_string() {
        LC_ALL=C tr -dc "$2" </dev/urandom | head -c "$1"
        echo
    }

    function _generate_uuid() {
        local uuid
        uuid=$(uuidgen | tr '[:upper:]' '[:lower:]')
        [[ "$1" == "upper" ]] && uuid=$(tr '[:lower:]' '[:upper:]' <<<"$uuid")
        echo "$uuid"
    }

    case "$1" in
    "pwd")
        _generate_random_string "$2" 'A-Za-z0-9!"#$%()*+,-./:;<?@[]^_`{|}~'
        ;;

    "alpha-num")
        _generate_random_string "$2" 'A-Za-z0-9'
        ;;

    "number")
        _generate_random_string "$2" '0-9'
        ;;
    "uuid")
        _generate_uuid "$2"
        ;;
    *)
        echo 'Supported commands are: pwd|alpha-num|number|uuid'
        ;;
    esac

}
