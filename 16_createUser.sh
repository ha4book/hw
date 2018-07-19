#/bin/bash

echo "#create pjt corp"
oc login -u system:admin
oc new-project corp

echo "#create user Amy Andrew Brian Betty"
ansible masters -m shell -a"htpasswd -b /etc/origin/master/htpasswd Amy r3dh4t1!"
ansible masters -m shell -a"htpasswd -b /etc/origin/master/htpasswd Andrew r3dh4t1!"
ansible masters -m shell -a"htpasswd -b /etc/origin/master/htpasswd Brian r3dh4t1!"
ansible masters -m shell -a"htpasswd -b /etc/origin/master/htpasswd Betty r3dh4t1!"

sleep 3

echo "#login"
oc login -u Amy -p r3dh4t1!
sleep 1

oc login -u Andrew -p r3dh4t1!
sleep 1

oc login -u Brian -p r3dh4t1!
sleep 1

oc login -u Betty -p r3dh4t1!
sleep 1

oc login -u system:admin

echo "#label client=alpha:Amy,Andrew client=beta:Brian,Betty"
oc label user/Amy client=alpha
oc label user/Andrew client=alpha
oc label user/Brian client=beta
oc label user/Betty client=beta

sleep 3

