FROM renovate/buildpack:1@sha256:10e98460170e2ed4ea5150f5baefe0589c60bd8c63bf1f06fac5b8a61b61040d

# renovate: datasource=docker depName=openjdk versioning=docker
ARG JAVA_VERSION=8
RUN install-tool java

# renovate: datasource=gradle-version depName=gradle versioning=gradle
ARG GRADLE_VERSION=5.6.4
RUN install-tool gradle

LABEL org.opencontainers.image.source="https://github.com/renovatebot/docker-gradle" \
      org.opencontainers.image.version="${GRADLE_VERSION}"

COPY --chown=ubuntu:0 settings.xml /home/ubuntu/.m2/settings.xml
COPY --chown=ubuntu:0 gradle.properties /home/ubuntu/.gradle/gradle.properties

USER 1000
