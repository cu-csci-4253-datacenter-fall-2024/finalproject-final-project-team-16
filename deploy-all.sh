#!/bin/sh
helm repo add bitnami https://charts.bitnami.com/bitnami
helm install -f minio/minio-config.yaml -n minio-ns --create-namespace minio-proj bitnami/minio

kubectl apply -f redis/redis-deployment.yaml
kubectl apply -f redis/redis-service.yaml

kubectl apply -f rest/rest-deployment.yaml
kubectl apply -f rest/rest-service.yaml
kubectl apply -f rest/rest-ingress.yaml

kubectl apply -f logging/logs-deployment.yaml

kubectl apply -f worker/worker-deployment.yaml

kubectl apply -f minio/minio-deployment.yaml
kubectl apply -f minio/minio-external-service.yaml