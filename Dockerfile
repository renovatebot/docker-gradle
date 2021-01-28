#--------------------------------------
# Ubuntu base image to use
#--------------------------------------
ARG FLAVOR=latest

#--------------------------------------
# renovate rebuild triggers
#--------------------------------------

# renovate: datasource=gradle-version depName=gradle versioning=gradle
ARG GRADLE_VERSION=6.8.1

FROM renovate/buildpack:2-java@sha256:5924f7adfc1484b7fe345159ccd87c8b209e762e60a4e507e8befb8666bb7a3b as base-latest
FROM renovate/buildpack:2-java-bionic@sha256:0b360cc4ddecf45aea012e5d5fda21029786d8742db83a2a8737f90ef6fb61d4 as base-bionic
FROM renovate/buildpack:2-java-focal@sha256:edc3b44987209ad4611203e134fe5af0233a18eabdb6892563ff0dea42cf0043 as base-focal

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
