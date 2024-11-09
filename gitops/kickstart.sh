#!/bin/bash

helm repo add argo https://argoproj.github.io/argo-helm

helm install argo-cd argo/argo-cd \
	--namespace=argocd \
	--create-namespace

kubectl apply -n argocd -f infrastructure/configs/argo-cd-cfg/appproj-infrastructure.yaml
kubectl apply -n argocd -f infrastructure/configs/argo-cd-cfg/appset-infrastructure-configs.yaml
