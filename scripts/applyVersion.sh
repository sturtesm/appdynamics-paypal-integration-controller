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

    CWD=`pwd`

    echo
    log "------------------- [ Applying ${STEP1} Changes to ${src} ] -----------------------"

    #change directory to where our source lives
    log "cd ${src}"
    cd ${src}

    #check-in our source code
    log "git add com"
    git add com

    #commit our changes
    log "git commit -m \"applying ${STEP}\""
    git commit -m \\"applying ${STEP}\\"
    
    #push our changes up
    log "git push"
    git push

    cd ${CWD}
    echo
    log "-------------- [ Done Applying ${STEP} changes to ${src} ] -------------------"
}

if [ -d ${JAVA_WEB_PROJECT_VERSIONS}/${STEP} ]
then
    log "cp -r ${JAVA_WEB_PROJECT_VERSIONS}/${STEP}/com ${JAVA_WEB_PROJECT_SRC}/"
    cp -r ${JAVA_WEB_PROJECT_VERSIONS}/${STEP}/com ${JAVA_WEB_PROJECT_SRC}/

    commitAndPush ${JAVA_WEB_PROJECT_SRC}
else
    echo
    log "---------------------------------------------------------------------------------------------"
    log "Didn't find ${STEP} for JAVA_WEB_PROJECT, won't apply any changes..."
    log "---------------------------------------------------------------------------------------------"
    echo
fi

if [ -d ${JAVA_SERVICES_PROJECT_VERSIONS}/${STEP} ]
then
    log "cp -r ${JAVA_SERVICES_PROJECT_VERSIONS}/${STEP}/com ${JAVA_SERVICES_PROJECT_SRC}"
    cp -r ${JAVA_SERVICES_PROJECT_VERSIONS}/${STEP}/com ${JAVA_SERVICES_PROJECT_SRC}

    commitAndPush ${JAVA_SERVICES_PROJECT_SRC}
else
    echo
    log "---------------------------------------------------------------------------------------------"
    echo "Didn't find ${STEP} for JAVA_SERVICES_PROJECT (${JAVA_SERVICES_PROJECT_VERSIONS}/${STEP}), won't apply any changes..."
    log "---------------------------------------------------------------------------------------------"
    echo
fi
