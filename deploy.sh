#! /bin/bash

SHA1=$1

# Deploy image to Docker Hub
#docker push danielnbarbosa/dogstatsd:$SHA1
docker push danielnbarbosa/dogstatsd

# Deploy to CoreOS cluster
ssh core@54.67.14.65 -C 'fleetctl stop dogstatsd@{1..3}.service; fleetctl start dogstatsd@{1..3}.service'
