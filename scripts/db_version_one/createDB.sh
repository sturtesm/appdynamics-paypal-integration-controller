#!/bin/bash

MYSQL=mysql

#note use readlink in linux, but not available on mac
TOP=/Users/steve.sturtevant/git/appdynamics-paypal-integration-demo/appdynamics-paypal-integration-controller/scripts/db_version_one

#create the db, user, grant access, etc....
echo "[INFO] Creating DB, Schema, and Privs..."
mysql -uroot -p < ${TOP}/purgeAndCreateDb.mysql

#load our accounts data
echo "[INFO] Loading accounts data...."
mysql -u root -p -e "use payments; load data infile '${TOP}/accounts.csv' into table accounts columns terminated by ','"
