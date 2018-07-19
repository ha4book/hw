#/bin/bash

export GUID=`hostname|awk -F. '{print $2}'`
mkdir /root/pvs

echo "#define pvs5Gi"

export volsize="5Gi"
for pvnum in {0001..0025} ; do
cat << EOF > /root/pvs/pv5g${pvnum}
{
  "apiVersion": "v1",
  "kind": "PersistentVolume",
  "metadata": {
    "name": "pv5g${pvnum}"
  },
  "spec": {
    "capacity": {
        "storage": "${volsize}"
    },
    "accessModes": [ "ReadWriteOnce" ],
    "nfs": {
        "path": "/srv/nfs/user-vols/pv10g${pvnum}",
        "server": "support1.${GUID}.internal"
    },
    "persistentVolumeReclaimPolicy": "Recycle"
  }
}
EOF
echo "Created def file for pv5g${pvnum}";
done;
sleep 3

echo "#define pvs10Gi"

export volsize="10Gi"
for pvnum in {0026..0050} ; do
cat << EOF > /root/pvs/pv10g${pvnum}
{
  "apiVersion": "v1",
  "kind": "PersistentVolume",
  "metadata": {
    "name": "pv10g${pvnum}"
  },
  "spec": {
    "capacity": {
        "storage": "${volsize}"
    },
    "accessModes": [ "ReadWriteMany" ],
    "nfs": {
        "path": "/srv/nfs/user-vols/pv10g${pvnum}",
        "server": "support1.${GUID}.internal"
    },
    "persistentVolumeReclaimPolicy": "Retain"
  }
}
EOF
echo "Created def file for pv10g${pvnum}";
done;
sleep 3


echo "#make pvs"
cat /root/pvs/* | oc create -f -

sleep 3

echo "#pvs check"
oc get pv

sleep 3

