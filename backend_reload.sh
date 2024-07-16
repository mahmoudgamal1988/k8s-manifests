#! /bin/bash
kubectl delete -f backend-statefulset-scheduler.yaml 
kubectl apply -f backend-statefulset-scheduler.yaml 
kubectl delete -f backend-statefulset.yaml 
kubectl apply -f backend-statefulset.yaml
