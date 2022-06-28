#!/usr/bin/env bash

export POD_NAME=$(kubectl get pods --namespace drone -l "app.kubernetes.io/name=drone,app.kubernetes.io/instance=drone" -o jsonpath="{.items[0].metadata.name}")
export CONTAINER_PORT=$(kubectl get pod --namespace drone $POD_NAME -o jsonpath="{.spec.containers[0].ports[0].containerPort}")
echo "Visit http://127.0.0.1:8080 to use your application"
kubectl --namespace drone port-forward $POD_NAME 8080:$CONTAINER_PORT
