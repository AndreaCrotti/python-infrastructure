#!/usr/bin/env bash

set -e

psql <<-EOSQL
     CREATE DATABASE test_django;
     CREATE USER test_django SUPERUSER LOGIN IDENTIFIED BY 'test_django';
EOSQL
