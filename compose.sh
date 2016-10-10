#!/usr/bin/env bash

docker-compose build -f Dockerfile.base  && docker-compose run test
