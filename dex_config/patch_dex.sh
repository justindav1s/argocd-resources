#!/bin/bash

oc project argocd

REDIRECTURI=https://argocd-server-argocd.apps.ocp4.datr.eu/api/dex/callback

oc annotate \
    serviceaccount argocd-dex-server \
    serviceaccounts.openshift.io/oauth-redirecturi.argocd=${REDIRECTURI} \
    --overwrite

oc describe sa argocd-dex-server