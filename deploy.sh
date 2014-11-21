#! /bin/bash

SHA1=$1

# Deploy image to Docker Hub
#docker push danielnbarbosa/docker-dogstatsd:$SHA1
docker push danielnbarbosa/docker-dogstatsd

# Deploy to CoreOS cluster
ssh core@54.67.14.65 -C 'fleetctl stop datadaog-dogstatsd@{1..3}.service; fleetctl start datadog-dogstatsd@{1..3}.service'
