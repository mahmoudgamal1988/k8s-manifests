#! /bin/bash

# Check if PLATFORM and SERVICE are provided
if [ -z "$1" ] || [ -z "$2" ]; then
  echo "Please provide platform and service names."
  exit 1
fi

# Assign parameters to variables and convert to lowercase
PLATFORM="$(echo "$1" | tr '[:upper:]' '[:lower:]')"
SERVICE="$(echo "$2" | tr '[:upper:]' '[:lower:]')"

HERE=$(pwd)
TIMESTAMP=$(date -I)_$(date +"%H%M")
TMP_DIR=DEEG_1001_OC.$TIMESTAMP
mkdir $TMP_DIR

echo tar-compressing database
#mongodump  -u 2135dac8bc8741f8  -p b7fe42219dcefc4a  --authenticationDatabase admin --db=ueyedata --excludeCollection=trendings --port 27017
#tar czf database_$TIMESTAMP.tar.gz dump
mv /mnt/nfs/mongo-backup/1001.archive $HERE/$TMP_DIR
#rm -rf dump

echo backup server logs
cd /mnt/nfs/server
tar czf logs_$TIMESTAMP.tar.gz logs
mv logs_$TIMESTAMP.tar.gz $HERE/$TMP_DIR

echo backup engine logs
cd /mnt/nfs/logs
tar czf engine_${PLATFORM:0:2}_${SERVICE:0:2}_$TIMESTAMP.tar.gz logs/${PLATFORM}_${SERVICE}*
mv engine_${PLATFORM:0:2}_${SERVICE:0:2}_$TIMESTAMP.tar.gz $HERE/$TMP_DIR

scp -r $HERE/$TMP_DIR support@octaeye.ddns.net:~/support/DEEG_1001
rm -rf $HERE/$TMP_DIR

#rsync -arvup --delete /usr/local/bin/actions/volumes/server/public/uploads/ /root/uploads
rsync -arvup --delete /mnt/nfs/server/public/uploads/screenshots/ support@umbrasys.ddns.net:/usr/local/bin/actions/volumes/server_debugging/public/uploads/screenshots_1001
