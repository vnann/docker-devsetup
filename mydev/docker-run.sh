#!/usr/bin/bash

IMAGE_VERSION="v1"
IMAGE_NAME="mydev"
CONTAINER_NAME="$IMAGE_NAME-$IMAGE_VERSION-$USER"

echo "Starting python dev environemnt container....."
echo "------------------------------------------------------"
echo " Docker Image Name:        $IMAGE_NAME"
echo " Docker Container Name:    $CONTAINER_NAME"
echo " Docker image:version:     $IMAGE_NAME:$IMAGE_VERSION"
echo "------------------------------------------------------"

docker run -it --name $CONTAINER_NAME --rm \
 --volume $(pwd):/home/devuser/$IMAGE_NAME \
 --net=host  $IMAGE_NAME:$IMAGE_VERSION
