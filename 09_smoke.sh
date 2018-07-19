#/bin/bash

echo "#make smoke-test pjt"
oc new-project smoke-test
oc project smoke-test

echo "#app nodejs-mongo-persistent"
oc new-app nodejs-mongo-persistent

echo "#wait 60"
sleep 60

echo "#pod check"
oc get pod 
sleep 3

echo "#route check"
oc get route
sleep 3

