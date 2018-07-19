#/bin/bash

echo "#yum update"
yum update
sleep 3

echo "#OCP util/client and docker install"
yum -y install atomic-openshift-utils atomic-openshift-clients docker
sleep 3

echo "#repolist"
yum repolist

