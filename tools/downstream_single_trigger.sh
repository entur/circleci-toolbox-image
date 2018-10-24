#!/bin/bash

# Trigger signle project by using CircleCI's API

# args: circlepath branch
# ex:   github/entur/tiamat master
# Requires environment variable ${CIRCLE_API_TOKEN}

set -euo pipefail

circle_project_url="https://circleci.com/api/v1.1/project/"

circle_ci_path="${1}"
branch="${2}"

echo "About to trigger Circle CI Path ${circle_ci_path} on branch ${branch}"

url="${circle_project_url}${circle_ci_path}/build?circle-token=${CIRCLE_API_TOKEN}"

curl --fail -X POST --header "Content-Type: application/json" -d '{"branch":"'"${branch}"'"}' "${url}"
