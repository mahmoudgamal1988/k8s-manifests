#! /bin/bash
kubectl exec -it mongodb-statefulset-0 -- bash -c "rm /backup/1001.archive; /bin/mongodump --gzip -u 2135dac8bc8741f8  -p b7fe42219dcefc4a  --authenticationDatabase admin --db=ueyedata_live --archive=/backup/1001.archive"
