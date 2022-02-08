#!/usr/bin/bash

IMAGE_VERSION="v1"
IMAGE_NAME="dev-python"
CONTAINER_NAME=$IMAGE_NAME

figlet -f big "Python Dev Env"
echo "Starting python dev environemnt container....."
echo "------------------------------------------------------"
echo " Docker Image Name:        $IMAGE_NAME"
echo " Docker Container Name:    $CONTAINER_NAME"
echo " Docker image:version:     $IMAGE_NAME:$IMAGE_VERSION"
echo "------------------------------------------------------"

docker run -it --name $CONTAINER_NAME --rm \
  --volume $(pwd):/home/devuser/$CONTAINER_NAME \
  --net=host  $IMAGE_NAME:$IMAGE_VERSION

