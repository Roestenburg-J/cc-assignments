#!/bin/bash

docker run \
  -d --rm \
  --name shortlived-container \
  --volume "$(pwd)/assignment":/usr/src/assignment \
  --volume /var/run/docker.sock:/var/run/docker.sock \  # Mount the Docker socket
  --network assignment-1-network \
  image/shortlived-container:latest

