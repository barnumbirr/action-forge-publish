#! /usr/bin/env bash

set -e

METADATA=$(cat metadata.json)
RELEASE_NAME=$(echo "$METADATA" | jq -r .name)
RELEASE_VERSION=$(echo "$METADATA" | jq -r .version)
NAME="pkg/$RELEASE_NAME-$RELEASE_VERSION"

if [ -z "$FORGE_API_KEY" ]; then
    echo "FORGE_API_KEY environment variable is not set, exiting..."
    exit 1
fi

if [ -z "$REPOSITORY_URL" ]; then
    echo "REPOSITORY_URL environment variable is not set, using Puppet Forge."
    REPOSITORY_URL='https://forgeapi.puppet.com/v3/releases'
fi

function build() {
    pdk build --force
}

function upload() {
    set -v
    curl \
        --fail \
        --silent \
        --max-time 5 \
        --show-error \
        --connect-timeout 5 \
        --request 'POST' \
        --form file="@$NAME".tar.gz \
        --header 'Content-Type: multipart/form-data' \
        --header "Authorization: Bearer $FORGE_API_KEY" \
        "$REPOSITORY_URL"
    set +v
}

build
upload
