#!/bin/sh

######  THIS FILE SPECIFIES THE ENVIRONMENT CONFIGURATION FOR THE DEVOPS DEMO ########
TOP=`dirname $0` 

#point to the location of the java checkout project

export JAVA_WEB_PROJECT=${TOP}/../../appdynamics-paypal-integration-java-checkout/Java_PayPalCheckout
export JAVA_WEB_PROJECT_SRC=${JAVA_WEB_PROJECT}/src/main/java
export JAVA_WEB_PROJECT_VERSIONS=${JAVA_WEB_PROJECT}/versions

export JAVA_SERVICES_PROJECT=${TOP}/../../appdynamics-paypal-integration-auth-service/PayPalAuthService
export JAVA_SERVICES_PROJECT_SRC=${JAVA_SERVICES_PROJECT}/src/main/java
export JAVA_SERVICES_PROJECT_VERSIONS=${JAVA_SERVICES_PROJECT}/versions

function log()
{
    msg=$1
    d=`date`
    echo "[${d}] $msg"
}

echo
echo "--------------- [ RESOLVING ENV VARS ] -----------"
echo
env | grep -e JAVA_WEB -e JAVA_SERVICE
echo
echo "--------------------------------------------------"
echo
