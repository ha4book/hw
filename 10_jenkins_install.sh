#/bin/bash

echo "#create user for jenkins"
ansible masters -m shell -a"htpasswd -b /etc/origin/master/htpasswd hashimoto r3dh4t1!"

echo "#create pjt jenkins"
oc login -u system:admin
oc new-project jenkins

echo "#policy add"
oc adm policy add-role-to-user edit hashimoto

sleep 3

echo "#install jenkins"
oc new-app jenkins-persistent --param ENABLE_OAUTH=true --param MEMORY_LIMIT=2Gi --param VOLUME_CAPACITY=4G
sleep 150

echo "#policy add"
oc adm pod-network make-projects-global jenkins
sleep 3

echo "#route"
oc get route
sleep 3

