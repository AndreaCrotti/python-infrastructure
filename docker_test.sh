#!/usr/bin/env bash

set -ex

if [[ "$KEEP_DB" -eq "1" ]]
then ARGS="-k"
else ARGS=""
fi

cd /deploy/app && ./manage.py test $ARGS
