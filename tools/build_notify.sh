#!/bin/bash

# Notify about project built and pushed to gcr
# The json structure is legacy
# Typically the API listening to this is Babylon

set -euo pipefail

if [ -z "${CIRCLE_PROJECT_REPONAME}" ]
then
    echo "Expected a variable called: CIRCLE_PROJECT_REPONAME. Exiting."
    exit 1
fi

echo "{\"name\": \"${CIRCLE_PROJECT_REPONAME}\", \"build\": {\"status\": \"SUCCESS\", \"phase\": \"FINALIZED\", \"scm\": {\"commit\": \"${CIRCLE_SHA1}\"}}}" > message.json &&
echo "sending: $(cat message.json) to ${BUILD_STATUS_URL}" &&
curl --fail -X POST --data @message.json -H "apiKey: ${BUILD_STATUS_API_KEY}" -H "Content-Type: application/json" -H "ET-Client-Name: CircleCI" -H "ET-Client-ID: CircleCI-${CIRCLE_PROJECT_REPONAME}"  "${BUILD_STATUS_URL}";
