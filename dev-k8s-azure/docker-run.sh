#!/usr/bin/bash

IMAGE_VERSION="v1"
IMAGE_NAME="dev-k8s-azure"
CONTAINER_NAME="$IMAGE_NAME-$USER"

echo "Starting Kubernetes dev environemnt container....."
echo "------------------------------------------------------"
echo " Docker Image Name:        $IMAGE_NAME"
echo " Docker Container Name:    $CONTAINER_NAME"
echo " Docker image:version:     $IMAGE_NAME:$IMAGE_VERSION"
echo "------------------------------------------------------"

docker run -it --name $CONTAINER_NAME --rm \
  --volume $(pwd):/home/devuser/$CONTAINER_NAME \
  --net=host  $IMAGE_NAME:$IMAGE_VERSION

