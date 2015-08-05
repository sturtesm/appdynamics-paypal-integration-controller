#!/bin/sh
TOP=`dirname $0`

nohup mvn test > /dev/null
