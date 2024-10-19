#!/bin/bash

test -f ./argo-values.yaml || exit 1

(
    helm repo add argo https://argoproj.github.io/argo-helm

    helm install argocd argo/argo-cd \
        --namespace=argocd \
        --create-namespace \
        -f argo-values.yaml

    kubectl apply -n argocd -f apps/root.yaml
)
