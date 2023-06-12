#!/bin/sh

helm delete binderhub-test
# eval $(minikube docker-env)
#(cd helm-chart && python3 -m chartpress --force-build) #Uncomment to rebuild from binderhub folder
(cd helm-chart && python3 -m chartpress) # uncomment for a quickier rebuild
(cd helm-chart/binderhub && helm dependency update)

helm upgrade --install binderhub-test helm-chart/binderhub \
    --values $1 \
    --set config.BinderHub.hub_url=http://c109-005.cloud.gwdg.de:30902 #\
    #--set config.GWDGGitLabRepoProvider.private_token="A2G5VUNa23qSP485Ny15" \
    #--set config.GWDGGitLabRepoProvider.access_token="A2G5VUNa23qSP485Ny15"
