#!/bin/bash

# Build the docker image

docker buildx build -t lib-builder-husarnet:master \
    --build-arg LIBBUILDER_CLONE_BRANCH_OR_TAG=master \
    --build-arg LIBBUILDER_CLONE_SHALLOW=1 \
    --build-arg LIBBUILDER_CLONE_URL=https://github.com/miloszlagan/esp32-arduino-lib-builder \
    tools/docker

# Build Arduino libs

docker run --rm -it -v $PWD:/arduino-esp32 -e TERM=xterm-256color lib-builder-husarnet:master ./build.sh