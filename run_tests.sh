#!/usr/bin/env bash

TEST_DOCKER="docker-test"

docker build . -f Dockerfile.base -t $TEST_DOCKER
docker run -t $TEST_DOCKER
