#!/bin/bash

test -f ./argo-values.yaml || exit 1

(
    helm repo add argo https://argoproj.github.io/argo-helm

    helm install argo-cd argo/argo-cd \
        --namespace=argocd \
        --create-namespace \
        -f argo-values.yaml

    kubectl apply -n argocd -f appproj-infrastructure.yaml
    kubectl apply -n argocd -f appset-infrastructure-configs.yaml
)
