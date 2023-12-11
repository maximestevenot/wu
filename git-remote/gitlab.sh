#!/bin/bash

function __get_inputs() {
    summarize=false
    echo_description=false

    while getopts ":pd" option; do
        case $option in
        p) # To summarize issue in shell
            summarize=true
            ;;
        d) # To print description
            echo_description=true
            ;;
        \?) # Invalid option
            echo "Error: Invalid option"
            ;;
        esac
    done

    shift $((OPTIND - 1))
    ticket_id="$1"
    echo "summarize=${summarize}; echo_description=${echo_description}; ticket_id=${1}"
}

function __handle_ticket() {
    ticket_id=$1
    ticket=$2
    summarize=$3
    echo_description=$4

    web_url="$(jq --raw-output '.web_url' <<<"$ticket")"

    if [ "$summarize" = true ]; then
        title="$(jq --raw-output '.title' <<<"$ticket")"
        state="$(jq --raw-output '.state' <<<"$ticket")"
        labels="$(jq --raw-output '.labels' <<<"$ticket")"

        ticket_path="/tmp/ticket-${ticket_id}.md"
        jq --raw-output '.description' <<<"$ticket" >>"$ticket_path"

        echo "[$ticket_id][$state] $title"
        echo "$labels"

        if [ "$echo_description" = true ]; then
            mdless "$ticket_path"
        else
            echo "$ticket_path"
        fi

    else
        open "$web_url"
    fi
}

function gissue() {
    eval "$(__get_inputs "$@")"
    ticket="$(curl -s --header "PRIVATE-TOKEN: ${GITLAB_API_TOKEN}" "${GITLAB_SERVER_URL}/api/v4/projects/${ISSUES_PROJECT_ID}/issues/$ticket_id")"
    __handle_ticket "$ticket_id" "$ticket" "$summarize" "$echo_description"
}

function gepic() {
    eval "$(__get_inputs "$@")"
    ticket="$(curl -s --header "PRIVATE-TOKEN: $GITLAB_API_TOKEN" "${GITLAB_SERVER_URL}/api/v4/groups/${EPICS_GROUP_ID}/epics/${ticket_id}")"
    __handle_ticket "$ticket_id" "$ticket" "$summarize" "$echo_description"
}

function gproject_id() {
    local remote="${1:-origin}"
    local url="$(git config --get "remote.${remote}.url")"
    local project_name="$(printf %s "${url//$GITLAB_SERVER_URL/}" | jq -sRr @uri)"
    curl -s --get --header "PRIVATE-TOKEN: ${GITLAB_API_TOKEN}" --location "${GITLAB_SERVER_URL}/api/v4/projects/${project_name}" | jq --raw-output '.id'
}
