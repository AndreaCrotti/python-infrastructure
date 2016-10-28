#!/usr/bin/env bash

DATABASES="default"

for db in $DATABASES
do ./manage.py migrate --database $db
done

pip install --trusted-host 172.17.42.1 --extra-index-url http://172.17.42.1:8001 dev-tools==0.1.5

mkdir /db_dumps; iw-db dump_all -c /dbs.yml /db_dumps/
