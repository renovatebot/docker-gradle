FROM renovate/buildpack:1@sha256:c6f6576e75d493c4a1ff50eb620cbd16ac38221f8c705ed5be3144d940e20d72

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
