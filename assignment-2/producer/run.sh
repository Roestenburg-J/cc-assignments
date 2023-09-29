#!/bin/bash

USAGE="
Usage: run.sh <topic>

    topic: The topic where messages are to be produced.
"

if ! (( $# > 0 )); then
    echo "$USAGE"
    exit 1
fi

topic="$1"

docker build \
    -f ./build/Dockerfile \
    -t image/experiment-producer ./build 


for i in 1 2 3
do
    docker run \
        --rm \
        -d \
        -v $(pwd)/build/auth:/usr/src/cc-assignment-2023/experiment-producer/auth \
        image/experiment-producer \
        --topic "$topic"
done

