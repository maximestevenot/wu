#!/bin/bash

function zoom() {
    python "$WU_FOLDER/zoom/zoom.py" "$WU_FOLDER/zoom/zoom.config.json" "$@"
}
