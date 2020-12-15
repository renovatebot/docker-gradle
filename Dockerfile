#--------------------------------------
# Ubuntu base image to use
#--------------------------------------
ARG FLAVOR=latest

#--------------------------------------
# renovate rebuild triggers
#--------------------------------------

# renovate: datasource=gradle-version depName=gradle versioning=gradle
ARG GRADLE_VERSION=6.7.1

FROM renovate/buildpack:2-java@sha256:5c5ef8f79790b9c51968a18e6c041ea17ea72fa45945c156e009b67212f19c9d as base-latest
FROM renovate/buildpack:2-java-bionic@sha256:4e9aa763c6968084b6a429a52ab058bb099ae84f48e66fd339898db0aad0d1d8 as base-bionic
FROM renovate/buildpack:2-java-focal@sha256:f1a9d70a1ad4468d4e0b5257bf52d0a89997468671f2d1cfb2f4ec4d80579598 as base-focal

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

USER 1000
