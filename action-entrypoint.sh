#!/bin/ash
docker build -f Dockerfile.kics -t kics-action --build-arg kics_docker_tag="$INPUT_KICS_DOCKER_TAG" . \
  && docker run kics-action
