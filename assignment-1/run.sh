#!/bin/bash

docker build -t image/shortlived-container:latest .

docker run \
  -d --rm \
  --name shortlived-container \
  --volume "$(pwd)/assignment2":/usr/src/assignment2\
  --network assignment-1-network\
  image/shortlived-container:latest

  

