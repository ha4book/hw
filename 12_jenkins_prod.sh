#/bin/bash

echo "#create pjt prod"
oc login -u system:admin
oc new-project prod

echo "#policy add"
oc policy add-role-to-user edit system:serviceaccount:jenkins:jenkins -n prod
oc adm policy add-role-to-user edit hashimoto
sleep 3

echo "#install jboss"
oc new-app jboss-eap70-openshift:1.6~https://github.com/ha4book/openshift-tasks
sleep 10

echo "#log check"
oc logs -f bc/openshift-tasks
sleep 3

echo "#expose svc"
oc expose svc openshift-tasks
sleep 3

echo "#trigger manual"
oc set triggers dc openshift-tasks --manual
sleep 3

echo "#route"
oc get route
sleep 3

