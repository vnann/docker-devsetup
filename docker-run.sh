#!/usr/bin/bash

echo "Starting Docker run..."

docker run -it --name devops-python-v2 --rm \
  --volume $(pwd):/home/devuser/devops-python \
  --net=host devops-python:v2

