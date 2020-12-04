#--------------------------------------
# Ubuntu base image to use
#--------------------------------------
ARG FLAVOR=latest

#--------------------------------------
# renovate rebuild triggers
#--------------------------------------

# renovate: datasource=gradle-version depName=gradle versioning=gradle
ARG GRADLE_VERSION=6.7.1

FROM renovate/buildpack:2-java@sha256:d68908e2e3acebaeedffeee877b84ae6680988e71a506691a5912fba761d1579 as base-latest
FROM renovate/buildpack:2-java-bionic@sha256:a587f10be454f03d208c4535358f572b7deac5f6aa7a0b471320c5797b7ddaf8 as base-bionic
FROM renovate/buildpack:2-java-focal@sha256:f1a9d70a1ad4468d4e0b5257bf52d0a89997468671f2d1cfb2f4ec4d80579598 as base-focal

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

COPY --chown=ubuntu:0 settings.xml /home/ubuntu/.m2/settings.xml
COPY --chown=ubuntu:0 gradle.properties /home/ubuntu/.gradle/gradle.properties

USER 1000
