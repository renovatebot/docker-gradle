FROM renovate/java:8@sha256:31fbceca72f069dd3a5cc8f9d3e294f9f7b394a7ec610a7ce2aa43be66946097

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
