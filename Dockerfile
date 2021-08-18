# renovate: datasource=adoptium-java depName=openjdk
ARG JAVA_VERSION=11.0.12+7

# renovate: datasource=gradle-version depName=gradle versioning=gradle
ARG GRADLE_VERSION=6.9


#--------------------------------------
# Image: final
#--------------------------------------
FROM renovate/buildpack:5-java@sha256:85f0817da310a13182980611f19afbf141f236b9151421794f65de8e1cda1dc3

ARG JAVA_VERSION
RUN install-tool java

ARG GRADLE_VERSION
RUN install-tool gradle

LABEL org.opencontainers.image.source="https://github.com/renovatebot/docker-gradle" \
  org.opencontainers.image.version="${GRADLE_VERSION}"

USER 1000
