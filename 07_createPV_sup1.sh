#/bin/bash

echo "#make pv(support1 run)"

mkdir -p /srv/nfs/user-vols/pv10g{0001..0200}

for pvnum in {0001..0050} ; do
echo "/srv/nfs/user-vols/pv10g${pvnum} *(rw,root_squash)" >> /etc/exports.d/openshift-uservols.exports
chown -R nfsnobody.nfsnobody  /srv/nfs
chmod -R 777 /srv/nfs
done

sleep 3

echo "#restart nfs-server"
systemctl restart nfs-server

sleep 3

