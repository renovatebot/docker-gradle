#--------------------------------------
# Ubuntu base image to use
#--------------------------------------
ARG FLAVOR=latest

#--------------------------------------
# renovate rebuild triggers
#--------------------------------------

# renovate: datasource=gradle-version depName=gradle versioning=gradle
ARG GRADLE_VERSION=6.7.1

FROM renovate/buildpack:2-java@sha256:fe80370bed66d5b606d76eea5a3c6a518d7004b2a525eebca667e2c652c54554 as base-latest
FROM renovate/buildpack:2-java-bionic@sha256:3443e75876ce29c85a4997782bb9aaefc8b61b111919ad2499f7fb472ee840ba as base-bionic
FROM renovate/buildpack:2-java-focal@sha256:0a12d1b5241166c0ee7753c14f28474aec0830a23c4b7cd64f5645635ba976a6 as base-focal

#--------------------------------------
# Image: final
#--------------------------------------
FROM base-${FLAVOR}

# renovate: datasource=docker depName=openjdk versioning=docker
ARG JAVA_VERSION=11
RUN install-tool java

ARG GRADLE_VERSION
RUN install-tool gradle

LABEL org.opencontainers.image.source="https://github.com/renovatebot/docker-gradle" \
      org.opencontainers.image.version="${GRADLE_VERSION}"

COPY --chown=ubuntu:0 settings.xml /home/ubuntu/.m2/settings.xml
COPY --chown=ubuntu:0 gradle.properties /home/ubuntu/.gradle/gradle.properties

USER 1000
