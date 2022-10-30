#!/bin/sh
VERSION=1.0.0

# Clean Docker Image
# docker rmi my-web-app:${VERSION}

# Build Docker Image
docker build -t my-web-app:${VERSION} .

# Deploy enquiry-app using Helm chart
cd helm-context
helm upgrade --install webapp ./webapp --values ./webapp/values.yaml --namespace asteroid-herder --create-namespace

# Deploy ingress controller
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.4.0/deploy/static/provider/cloud/deploy.yaml

# Delete enquiry app from the cluster
# helm uninstall webapp