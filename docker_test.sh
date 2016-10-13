#!/usr/bin/env bash

set -ex

if [[ "$KEEP_DB" -eq "1" ]]
then ARGS="--reuse-db"
else ARGS=""
fi

cd /deploy/app && py.test api/tests.py $ARGS --junit-xml=reports/tests.xml
