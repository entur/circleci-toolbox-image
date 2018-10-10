#!/bin/bash

set -euo pipefail

if [ -z $CLOUD_SERVICE_KEY ]
then
    echo "$CLOUD_SERVICE_KEY needs to be set in order to activate service account";
    exit 1;
fi

echo $GCLOUD_SERVICE_KEY > ${HOME}/account-auth.json

cat ${HOME}/account-auth.json | docker login -u _json_key --password-stdin https://eu.gcr.io