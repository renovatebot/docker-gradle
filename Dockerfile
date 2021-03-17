# renovate: datasource=docker depName=openjdk versioning=docker
ARG JAVA_VERSION=11

# renovate: datasource=gradle-version depName=gradle versioning=gradle
ARG GRADLE_VERSION=6.8.3


#--------------------------------------
# Image: final
#--------------------------------------
FROM renovate/buildpack:4-java@sha256:5b6b7e47ef757245d5cb0330a5f02d4ed5f5584b937603d61f94cf02568f389c

ARG JAVA_VERSION
RUN install-tool java

ARG GRADLE_VERSION
RUN install-tool gradle

LABEL org.opencontainers.image.source="https://github.com/renovatebot/docker-gradle" \
  org.opencontainers.image.version="${GRADLE_VERSION}"

USER 1000
