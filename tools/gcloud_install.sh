#!/bin/bash

set -euo pipefail

VER="218.0.0-linux-x86_64"
wget https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-${VER}.tar.gz
tar -xvzf google-cloud-sdk-${VER}.tar.gz
./google-cloud-sdk/install.sh -q
./google-cloud-sdk/bin/gcloud components update
rm google-cloud-sdk-${VER}.tar.gz;