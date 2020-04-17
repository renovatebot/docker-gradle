FROM renovate/java:8@sha256:bb285456ecc9342c947c1e992e8aa9303e0495b59deb2d41a0235ca96e51979d

USER root

# renovate: datasource=gradle-version depName=gradle versioning=gradle
ARG GRADLE_VERSION=5.6.4

LABEL org.opencontainers.image.source="https://github.com/renovatebot/docker-gradle" \
      org.opencontainers.image.version="${GRADLE_VERSION}"


# required by installer
# renovate: datasource=docker depName=renovate/java versioning=docker
ARG JAVA_VERSION=8

RUN /usr/local/build/gradle.sh

COPY --chown=ubuntu:0 settings.xml /home/ubuntu/.m2/settings.xml
COPY --chown=ubuntu:0 gradle.properties /home/ubuntu/.gradle/gradle.properties

USER 1000
