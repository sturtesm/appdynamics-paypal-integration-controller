#!/bin/sh

TOP=`dirname $0`
PWD=`pwd`

. ${TOP}/env.sh

#the step we're applying

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

CWD=`pwd`
cd ${JAVA_WEB_PROJECT_SRC}
touch com/appdynamics/sample/servlet/README #if we have an empty folder, then git removes the directory
git rm -r com/appdynamics/sample/servlet/*.java
cd ${CWD}
commitAndPush ${JAVA_WEB_PROJECT_SRC}

cd ${JAVA_SERVICES_PROJECT_SRC}
touch com/appdynamics/sample/README #if we have an empty folder, then git removes the directory
git rm -r com/appdynamics/sample/service/*.java
cd ${CWD}
commitAndPush ${JAVA_SERVICES_PROJECT_SRC}


