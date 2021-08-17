# renovate: datasource=docker depName=openjdk versioning=docker
ARG JAVA_VERSION=11

# renovate: datasource=gradle-version depName=gradle versioning=gradle
ARG GRADLE_VERSION=6.9


#--------------------------------------
# Image: final
#--------------------------------------
FROM renovate/buildpack:5-java@sha256:ae90588e3ec5be8d5638ac09b37a184434a78cac0e2500aedcd42aa1f91c9b25

ARG JAVA_VERSION
RUN install-tool java

ARG GRADLE_VERSION
RUN install-tool gradle

LABEL org.opencontainers.image.source="https://github.com/renovatebot/docker-gradle" \
  org.opencontainers.image.version="${GRADLE_VERSION}"

USER 1000
