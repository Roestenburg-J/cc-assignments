#!/bin/bash

set -e

USAGE="
Usage: run.sh <topic>

    topic: The topic where messages are to be produced.
"

if ! (( $# > 0 )); then
    echo "$USAGE"
    exit -1
fi

topic="$1"

docker build -t image/simple-consumer .

docker run \
    --rm \
    --name simple-consumer \
    -v "$(pwd)/auth":/usr/src/app/auth \
    -v "$(pwd)/schemas":/usr/src/app/schemas \
    image/simple-consumer consume "$topic"
