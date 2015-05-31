#!/bin/sh

TOP=`dirname $0`
PWD=`pwd`

. ${TOP}/env.sh

if [ "$1" = "" ]; then
    echo
    log "--------------------------------"
    log "[ERROR] USAGE: applyVersion.sh <step[1,2,3,etc..]>"
    log "--------------------------------"
    echo
    exit 1
fi

#the step we're applying
STEP=$1;
function commitAndPush()
{
    src=$1

    PWD=`pwd`
    cd ${src}
    echo "git add ${src}"
    echo "git commit -m applying ${STEP}"
    echo "git push"
    cd ${PWD}
}

if [ -d ${JAVA_WEB_PROJECT_VERSIONS}/${STEP} ]
then
    log "cp -r ${JAVA_WEB_PROJECT_VERSIONS}/${STEP}/com ${JAVA_WEB_PROJECT_SRC}/"
    echo "cp -r ${JAVA_WEB_PROJECT_VERSIONS}/${STEP}/com ${JAVA_WEB_PROJECT_SRC}/"
    commitAndPush ${JAVA_WEB_PROJECT_SRC}
else
    echo "Didn't find ${STEP} for JAVA_WEB_PROJECT, won't apply any changes..."
fi

if [ -d ${JAVA_SERVICES_PROJECT_VERSIONS}/${STEP} ]
then
    log "cp -r ${JAVA_SERVICES_PROJECT_VERSIONS}/${STEP}/com ${JAVA_SERVICES_PROJECT_SRC}"
    echo "cp -r ${JAVA_SERVICES_PROJECT_VERSIONS}/${STEP}/com ${JAVA_SERVICES_PROJECT_SRC}"

    commitAndPush ${JAVA_SERVICES_PROJECT_VERSIONS} 
else
    echo "Didn't find ${STEP} for JAVA_SERVICES_PROJECT, won't apply any changes..."
fi
