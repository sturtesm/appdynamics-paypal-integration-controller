#!/bin/sh
TOP=`dirname $0`

for i in 1 2 3 4 5; do
     TS=`date`
      echo "[$TS] ${TOP}/applyVersion.sh step${i}" >> applyChangesOverTime.log
       ${TOP}/applyVersion.sh step${i}
        sleep 7200
    done
