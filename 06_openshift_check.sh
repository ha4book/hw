#/bin/bash

echo "#get .kube/config"
ansible masters[0] -b -m fetch -a "src=/root/.kube/config dest=/root/.kube/config flat=yes"

echo "#status check"
oc whoami
oc get nodes --show-labels
oc get pod --all-namespaces -o wide

sleep 3

