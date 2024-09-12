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

echo backup engine logs
cd /mnt/nfs/logs
tar czf engine_${PLATFORM:0:2}_${SERVICE:0:2}_$TIMESTAMP.tar.gz ${PLATFORM}_${SERVICE}*
mv engine_${PLATFORM:0:2}_${SERVICE:0:2}_$TIMESTAMP.tar.gz $HERE/$TMP_DIR

scp -r $HERE/$TMP_DIR support@octaeye.ddns.net:~/support/DEEG_1001
rm -rf $HERE/$TMP_DIR

