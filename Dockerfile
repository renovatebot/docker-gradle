# renovate: datasource=adoptium-java depName=openjdk
ARG JAVA_VERSION=11.0.12+7

# renovate: datasource=gradle-version depName=gradle versioning=gradle
ARG GRADLE_VERSION=6.9.1


#--------------------------------------
# Image: final
#--------------------------------------
FROM renovate/buildpack:5@sha256:ca864d8398d4bb06a7787d6834d8c80ae6aadadeed5dbc8b9131acf9946ab6ec

ARG JAVA_VERSION
RUN install-tool java

ARG GRADLE_VERSION
RUN install-tool gradle

LABEL org.opencontainers.image.source="https://github.com/renovatebot/docker-gradle" \
  org.opencontainers.image.version="${GRADLE_VERSION}"

USER 1000
