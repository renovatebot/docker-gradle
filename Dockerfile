# renovate: datasource=gradle-version depName=gradle versioning=gradle
ARG GRADLE_VERSION=5.6.4

FROM renovate/buildpack:2-java@sha256:dcb22a9ffcbf406e4dc6f6a8c1978ff6f6d9db3271d65d3a1ddafe95e1e2d81d

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
