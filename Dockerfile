# renovate: datasource=docker depName=openjdk versioning=docker
ARG JAVA_VERSION=11

# renovate: datasource=gradle-version depName=gradle versioning=gradle
ARG GRADLE_VERSION=6.8.3


#--------------------------------------
# Image: final
#--------------------------------------
FROM renovate/buildpack:4-java@sha256:e196fc8fdbfe8eba62bbbe6692b686d1d0332325c6a254a0968767d23f75bf03

ARG JAVA_VERSION
RUN install-tool java

ARG GRADLE_VERSION
RUN install-tool gradle

LABEL org.opencontainers.image.source="https://github.com/renovatebot/docker-gradle" \
  org.opencontainers.image.version="${GRADLE_VERSION}"

USER 1000
