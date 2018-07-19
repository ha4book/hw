#/bin/bash
echo "#set GUID"
export GUID=`hostname | awk -F. '{print $2}'`
echo "GUID:$GUID"

