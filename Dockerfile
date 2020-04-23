FROM renovate/buildpack:1@sha256:e2e416bf17d2e58a8a6042a15dcb559048b11bc5e3143b7c7a33d38e01d8236a

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
