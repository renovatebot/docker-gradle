#--------------------------------------
# Ubuntu base image to use
#--------------------------------------
ARG FLAVOR=latest

#--------------------------------------
# renovate rebuild triggers
#--------------------------------------

# renovate: datasource=gradle-version depName=gradle versioning=gradle
ARG GRADLE_VERSION=6.8.2

FROM renovate/buildpack:3-java@sha256:00196fa99764f31dd4c6c514c3936533ee90abf48e604b55514a41b90cf7218e as base-latest
FROM renovate/buildpack:3-java-bionic@sha256:469e8a26662dae9707b2e4f9f898b5e8cd5ef397a1331e000de7f358f890d608 as base-bionic
FROM renovate/buildpack:3-java-focal@sha256:a49a715e5203dbb9a9e6ce0d1f9639d0aca478473ad58fb166670a6a163366f0 as base-focal

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
