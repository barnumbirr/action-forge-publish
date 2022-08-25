FROM ghcr.io/barnumbirr/alpine-pdk:1.9.1

LABEL "com.github.actions.name"="action-forge-publish"
LABEL "com.github.actions.description"="Build and publish module to Puppet Forge"
LABEL "com.github.actions.icon"="upload-cloud"
LABEL "com.github.actions.color"="orange"

LABEL "name"="Publish to Puppet Forge"
LABEL "version"="2.9.1"
LABEL "repository"="https://github.com/barnumbirr/action-forge-publish"
LABEL "maintainer"="Martin Simon <me@martinsimon.me>"

RUN apk add --no-cache \
    bash \
    curl \
    jq

ADD entrypoint.sh /entrypoint.sh
RUN gem install io-console
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
