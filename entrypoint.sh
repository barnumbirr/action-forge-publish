#! /usr/bin/env bash

set -e

METADATA=$(cat metadata.json)
RELEASE_NAME=$(echo "${METADATA}" | jq -r .name)
RELEASE_VERSION=$(echo "${METADATA}" | jq -r .version)
NAME="pkg/${RELEASE_NAME}-${RELEASE_VERSION}"

function build() {
    pdk build
}

function upload() {
    curl -D- --fail --request 'POST' "$REPOSITORY_URL" \
      -F file="@${NAME}".tar.gz \
      -H "Authorization: Bearer $FORGE_API_KEY"
}

build
upload
