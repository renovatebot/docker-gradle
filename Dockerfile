# renovate: datasource=docker depName=openjdk versioning=docker
ARG JAVA_VERSION=11

# renovate: datasource=gradle-version depName=gradle versioning=gradle
ARG GRADLE_VERSION=6.9


#--------------------------------------
# Image: final
#--------------------------------------
FROM renovate/buildpack:5-java@sha256:a6827a3e82251b6f78b72fc0de7c0397539371c8a2f216b50893684cdcc7d5ca

ARG JAVA_VERSION
RUN install-tool java

ARG GRADLE_VERSION
RUN install-tool gradle

LABEL org.opencontainers.image.source="https://github.com/renovatebot/docker-gradle" \
  org.opencontainers.image.version="${GRADLE_VERSION}"

USER 1000
