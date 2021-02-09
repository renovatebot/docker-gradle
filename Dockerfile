#--------------------------------------
# Ubuntu base image to use
#--------------------------------------
ARG FLAVOR=latest

#--------------------------------------
# renovate rebuild triggers
#--------------------------------------

# renovate: datasource=gradle-version depName=gradle versioning=gradle
ARG GRADLE_VERSION=6.8.2

FROM renovate/buildpack:4-java@sha256:18cbf071a6ff412e7916fb57593ec944b7f2983b4b36d49bf9cfe78ae1e5b162 as base-latest
FROM renovate/buildpack:3-java-bionic@sha256:15a25e6a45e8cd3ce0b7dcca2057d36b1244f2ba7fadab22e7751d1cba165138 as base-bionic
FROM renovate/buildpack:3-java-focal@sha256:9f6de6cca6e499df757dc2e8ee557587c68939a44f3e32506c8e3dd651bfad4c as base-focal

#--------------------------------------
# Image: final
#--------------------------------------
FROM base-${FLAVOR}

# renovate: datasource=docker depName=openjdk versioning=docker
ARG JAVA_VERSION=11
RUN install-tool java

ARG GRADLE_VERSION
RUN install-tool gradle

LABEL org.opencontainers.image.source="https://github.com/renovatebot/docker-gradle" \
  org.opencontainers.image.version="${GRADLE_VERSION}"

USER 1000
