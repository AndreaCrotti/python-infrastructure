#!/usr/bin/env bash

docker-compose --verbose build test  && docker-compose --verbose up test
