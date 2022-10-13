#!/bin/bash

## Simple script to build images
# Usage:
# $ scripts/build.sh [PHP_PRETTY_VERSION] [OS_VERSION] [PHP_TYPE]
#
# where:
# OS_MAJOR: major version of CentOs ex: 7
# OS_MAJOR_MINOR_VERSION: major.minor version of CentOs ex: 7.9

set -o errexit
set -o nounset
set -o pipefail
# set -o xtrace # Uncomment this line for debugging purpose

# Arguments
OS_MAJOR=$1
OS_MAJOR_MINOR_VERSION=$2

# Variables
DOCKERFILE="${OS_MAJOR}/${OS_MAJOR_MINOR_VERSION}/Dockerfile"
FROM=$(head -1 "${DOCKERFILE}" | awk '{print $2}')
LATEST=$(cat .latest)

docker build \
  -f "${OS_MAJOR}"/"${OS_MAJOR_MINOR_VERSION}"/Dockerfile \
  -t bmeme/docker-ansible-ol:"${OS_MAJOR}" \
  -t bmeme/docker-ansible-ol:"${OS_MAJOR_MINOR_VERSION}" .

if [[ $(echo "${FROM}" | awk -F: '{print $2}') == "${LATEST}" ]]; then
    docker build \
      -f "${OS_MAJOR}"/"${OS_MAJOR_MINOR_VERSION}"/Dockerfile \
      -t bmeme/docker-ansible-ol:latest .
fi