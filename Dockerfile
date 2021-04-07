# renovate: datasource=docker depName=openjdk versioning=docker
ARG JAVA_VERSION=11

# renovate: datasource=gradle-version depName=gradle versioning=gradle
ARG GRADLE_VERSION=6.8.3


#--------------------------------------
# Image: final
#--------------------------------------
FROM renovate/buildpack:5-java@sha256:66b1150551b5c04146ba8d24f586342102fcddad2b314cef819e65f4892ccf9b

ARG JAVA_VERSION
RUN install-tool java

ARG GRADLE_VERSION
RUN install-tool gradle

LABEL org.opencontainers.image.source="https://github.com/renovatebot/docker-gradle" \
  org.opencontainers.image.version="${GRADLE_VERSION}"

USER 1000
