#!/bin/bash

IMAGE_NAME=gps_docker:latest

SCRIPT_DIR=$(cd $(dirname $0); pwd)

xhost +

docker run -it --rm \
  --privileged \
  --volume="/dev:/dev" \
  --volume="$SCRIPT_DIR/:/root/gps_docker/" \
  --net="host" \
  $IMAGE_NAME \
  bash -c "source /ros_entrypoint.sh && roslaunch gps_docker/gps.launch $@"
