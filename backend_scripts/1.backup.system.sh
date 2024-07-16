#! /bin/bash

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

scp -r $HERE/$TMP_DIR support@octaeye.ddns.net:~/support/DEEG_1001
rm -rf $HERE/$TMP_DIR

#rsync -arvup --delete /usr/local/bin/actions/volumes/server/public/uploads/ /root/uploads
rsync -arvup --delete /mnt/nfs/server/public/uploads/screenshots/ support@umbrasys.ddns.net:/usr/local/bin/actions/volumes/server_debugging/public/uploads/screenshots_1001
