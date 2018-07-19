#/bin/bash

echo "#master-list"
ansible masters --list-hosts
sleep 3

echo "#node-list"
ansible nodes --list-hosts
sleep 3

echo "#all-list"
ansible all --list-hosts
sleep 3

echo "#ping check"
ansible all -m ping
sleep 3

echo "#docker status"
ansible nodes -m shell -a"systemctl status docker | grep Active"
sleep 3

echo "#version check"
ansible nodes -m shell -a"docker version|grep Version"
sleep 3

echo "#yum repolist"
ansible all -m shell -a"yum repolist"
sleep 3

echo "#nfs exportfs"
ansible nfs -m shell -a"exportfs"
sleep 3

