# renovate: datasource=docker depName=openjdk versioning=docker
ARG JAVA_VERSION=11

# renovate: datasource=gradle-version depName=gradle versioning=gradle
ARG GRADLE_VERSION=6.9


#--------------------------------------
# Image: final
#--------------------------------------
FROM renovate/buildpack:5-java@sha256:8b4200d010c7af32be4ea7d6102247f9cb695edf6260748e9132997aede4679b

ARG JAVA_VERSION
RUN install-tool java

ARG GRADLE_VERSION
RUN install-tool gradle

LABEL org.opencontainers.image.source="https://github.com/renovatebot/docker-gradle" \
  org.opencontainers.image.version="${GRADLE_VERSION}"

USER 1000
