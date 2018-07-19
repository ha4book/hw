#/bin/bash

echo "#install"
ansible-playbook -f 20 /usr/share/ansible/openshift-ansible/playbooks/deploy_cluster.yml
sleep 3

