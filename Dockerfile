# renovate: datasource=docker depName=openjdk versioning=docker
ARG JAVA_VERSION=11

# renovate: datasource=gradle-version depName=gradle versioning=gradle
ARG GRADLE_VERSION=6.8.3


#--------------------------------------
# Image: final
#--------------------------------------
FROM renovate/buildpack:4-java@sha256:395e0a660cef640eff0a220e238e525a14979b21be339e7afcaa87185a65bfbb

ARG JAVA_VERSION
RUN install-tool java

ARG GRADLE_VERSION
RUN install-tool gradle

LABEL org.opencontainers.image.source="https://github.com/renovatebot/docker-gradle" \
  org.opencontainers.image.version="${GRADLE_VERSION}"

USER 1000
