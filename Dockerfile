# renovate: datasource=adoptium-java depName=openjdk
ARG JAVA_VERSION=11.0.12+7

# renovate: datasource=gradle-version depName=gradle versioning=gradle
ARG GRADLE_VERSION=6.9.1


#--------------------------------------
# Image: final
#--------------------------------------
FROM renovate/buildpack:5@sha256:c60d8507223bf9b1c0ca555cb20789a2eaaaa8a3702672dd9a4d7c9b140345f7

ARG JAVA_VERSION
RUN install-tool java

ARG GRADLE_VERSION
RUN install-tool gradle

LABEL org.opencontainers.image.source="https://github.com/renovatebot/docker-gradle" \
  org.opencontainers.image.version="${GRADLE_VERSION}"

USER 1000
