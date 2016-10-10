#!/usr/bin/env bash

TEST_DOCKER="docket-test"

docker build . -t $TEST_DOCKER
docker run -t $TEST_DOCKER
