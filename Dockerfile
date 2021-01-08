#--------------------------------------
# Ubuntu base image to use
#--------------------------------------
ARG FLAVOR=latest

#--------------------------------------
# renovate rebuild triggers
#--------------------------------------

# renovate: datasource=gradle-version depName=gradle versioning=gradle
ARG GRADLE_VERSION=6.8

FROM renovate/buildpack:2-java@sha256:83242f6830148226d7767fcc3e64da365a5eb96b42a0b4f2e2c981d5968232d3 as base-latest
FROM renovate/buildpack:2-java-bionic@sha256:3a0cbf03144806d8dcc13c626a0a6b50e06738ca33cb1d0f7053cb9b9738a007 as base-bionic
FROM renovate/buildpack:2-java-focal@sha256:3d9ae715feceba88809299fe11bdbc720886c646d6ca6a4b2300d1f03b193e67 as base-focal

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
