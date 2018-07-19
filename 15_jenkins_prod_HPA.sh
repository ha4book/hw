#/bin/bash

echo "#make LimitRang"
oc create -f ./files/limitrange.yaml -n prod

sleep 3

echo "#set autoscale"
oc autoscale dc/openshift-tasks --min 1 --max 5 --cpu-percent=80 -n prod
sleep 3

echo "#rollout"
oc rollout latest openshift-tasks -n prod

echo "#status check"
oc get hpa/openshift-tasks -n prod
sleep 3

oc describe hpa/openshift-tasks -n prod
sleep 3

