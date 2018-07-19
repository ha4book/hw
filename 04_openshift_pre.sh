#/bin/bash

echo "#pre check"
ansible-playbook -f 20 /usr/share/ansible/openshift-ansible/playbooks/prerequisites.yml
sleep 3

