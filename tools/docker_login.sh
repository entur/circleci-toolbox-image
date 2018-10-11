#!/bin/bash

set -euo pipefail

docker --version
docker login -u _json_key --password-stdin https://eu.gcr.io <<< "${GCLOUD_SERVICE_KEY}"