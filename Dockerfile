# renovate: datasource=gradle-version depName=gradle versioning=gradle
ARG GRADLE_VERSION=6.5.1

FROM renovate/buildpack:2-java@sha256:04473b106c3c23a092519682636b3f576e4f49490023a4bf0a427f4eba6b183a

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
