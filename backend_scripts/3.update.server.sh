#! /bin/bash

tar xf server.tar.gz 
cd /mnt/nfs/server/
mv public/uploads/ .
rm -rf public.old
mv public public.old
rm -rf src.old
mv src src.old
mv /mnt/nfs/scripts/public/ .
mv /mnt/nfs/scripts/src/ .
rm -rf public/uploads/
mv uploads public/

echo done.
echo now, please use kubectl command on master to restart backend
echo "kubectl delete -f backend-statefulset-scheduler.yaml ; kubectl apply -f backend-statefulset-scheduler.yaml ; kubectl delete -f backend-statefulset.yaml ; kubectl apply -f backend-statefulset.yaml"
