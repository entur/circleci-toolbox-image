#!/bin/bash

# Authenticate with goocle cloud. Requires GCLOUD_SERVICE_KEY

set -euo pipefail

if [ -z $CLOUD_SERVICE_KEY ]
then
    echo "$CLOUD_SERVICE_KEY needs to be set in order to activate service account";
    exit 1;
fi

echo $GCLOUD_SERVICE_KEY > ${HOME}/account-auth.json
gcloud auth activate-service-account --key-file ${HOME}/account-auth.json