#!/bin/bash

docker build -t image/shortlived-container .

docker run \
  -d --rm \
  --name shortlived-container \
  --volume "$(pwd)/assignment":/usr/src/assignment\
  --network assignment-1-network\
  shortlived-container
  