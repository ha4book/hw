#/bin/bash

echo "#is del prod"
oc delete is/openshift-tasks -n prod
sleep 3

echo "#bc del prod"
oc delete bc/openshift-tasks -n prod
sleep 3

echo "#policy add"
oc policy add-role-to-user system:image-puller system:serviceaccount:prod:default -n dev
sleep 3

