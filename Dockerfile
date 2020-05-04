FROM renovate/buildpack:2-java@sha256:aadf9b5cf767a7efc2041937363444cea8dd5fd549fa1e68630bb07dcb7679fb

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
