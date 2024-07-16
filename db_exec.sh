#! /bin/bash
kubectl exec -it mongodb-statefulset-0 -- bash

# mongosh -u 2135dac8bc8741f8  -p b7fe42219dcefc4a  --authenticationDatabase admin
# use ueyedata_live;
# ex: db.accounts.find({},{firstName: 1}).sort({createdAt: -1})[.limit(1)][.count()]
