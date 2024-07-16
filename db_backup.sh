#! /bin/bash
kubectl exec -it mongodb-statefulset-0 -- bash -c "/bin/mongodump --gzip -u 2135dac8bc8741f8  -p b7fe42219dcefc4a  --authenticationDatabase admin --db=ueyedata_live --archive=/backup/1001.archive; ls -lh /backup"

# to load into server_debugging database
# screen mongorestore --gzip -u 8bc41f872135dac8  -p 36Gac8bXn726fHW  --authenticationDatabase admin --port 27020 --nsFrom='ueyedata_live.*' --nsTo='ueyedata_1001_000024.*' --archive=1001.archive
