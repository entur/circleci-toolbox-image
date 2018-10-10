#!/bin/bash

set -euo pipefail

IMAGE="eu.gcr.io/${CLOUDSDK_CORE_PROJECT}/${CIRCLE_PROJECT_REPONAME}"
echo "Image: ${IMAGE}"

docker build -t $IMAGE .
docker tag ${IMAGE} ${IMAGE}:$CIRCLE_SHA1
docker push $IMAGE