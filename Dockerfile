# renovate: datasource=gradle-version depName=gradle versioning=gradle
ARG GRADLE_VERSION=6.6.1

FROM renovate/buildpack:2-java@sha256:e0ebbeb25d13106ebbc7dd561426e2ecee4cd0178d28c46ec8135f4b78f72539

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
