# renovate: datasource=gradle-version depName=gradle versioning=gradle
ARG GRADLE_VERSION=6.6.1

FROM renovate/buildpack:2-java@sha256:b0b10a8f0b9bfaeba30f75b24a00c95e84dfddf86d0bbad2b73bd299956befa7

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
