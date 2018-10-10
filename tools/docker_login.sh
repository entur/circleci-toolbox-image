#!/bin/bash

set -euo pipefail

echo $GCLOUD_SERVICE_KEY > ${HOME}/account-auth.json
wc -l ${HOME}/account-auth.json
cat ${HOME}/account-auth.json | docker login -u _json_key --password-stdin https://eu.gcr.io