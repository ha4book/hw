#/bin/bash

echo "#make user template"
oc create -f ./files/user_template.yaml

sleep 3

echo "#make project template"
oc create -f ./files/project_template.yaml

sleep 3

