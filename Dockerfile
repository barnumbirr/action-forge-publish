FROM puppet/pdk:1.14.1.0

LABEL "com.github.actions.name"="action-forge-publish"
LABEL "com.github.actions.description"="Build and publish module to Puppet Forge"
LABEL "com.github.actions.icon"="upload-cloud"
LABEL "com.github.actions.color"="orange"

LABEL "name"="Publish to Puppet Forge"
LABEL "version"="1.0.0"
LABEL "repository"="https://github.com/barnumbirr/action-forge-publish"
LABEL "maintainer"="Martin Simon <me@martinsimon.me>"

RUN apt-get update && \
    apt-get install -y curl jq --no-install-recommends

ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
