#--------------------------------------
# Ubuntu base image to use
#--------------------------------------
ARG FLAVOR=latest

#--------------------------------------
# renovate rebuild triggers
#--------------------------------------

# renovate: datasource=gradle-version depName=gradle versioning=gradle
ARG GRADLE_VERSION=6.8

FROM renovate/buildpack:2-java@sha256:80829e417216bc5c567d4588373c7d7668b8321283682acccfafa86082780c04 as base-latest
FROM renovate/buildpack:2-java-bionic@sha256:95e2a2154f8f649e7c74c240936a8565043831dfea950e3d16fbdbde1b6dc3e7 as base-bionic
FROM renovate/buildpack:2-java-focal@sha256:6f2e46d076bf45c07c841f13a7f72a3153310471f5d08604a5a7b9fd3338c91d as base-focal

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
