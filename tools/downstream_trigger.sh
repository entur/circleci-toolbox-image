#!/bin/bash

# Trigger downstream projects by using CircleCI's API

set -euo pipefail

circle_project_url="https://circleci.com/api/v1.1/project/"

for github_project in ${GITHUB_PROJECTS}
do
    echo "Trigger ${github_project}"
    ## TODO: Control the branch to trigger build on?
    branch="master"
    url="${circle_project_url}github/entur/${github_project}/build?circle-token=${CIRCLE_API_TOKEN}"
    curl -X POST --header "Content-Type: application/json" -d '{"branch":"'${branch}'"}' "${url}"
done

