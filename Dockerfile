FROM renovate/buildpack@sha256:15f9ea4d553c535d050599f6ca7366dda938c742fe20c8f529fd94b6fa02af86

# renovate: datasource=gradle-version depName=gradle versioning=maven
ARG GRADLE_VERSION=5.6.4

LABEL org.opencontainers.image.source="https://github.com/renovatebot/docker-gradle" \
      org.opencontainers.image.version="${GRADLE_VERSION}"

RUN /usr/local/build/gradle.sh

COPY --chown=ubuntu:0 settings.xml /home/ubuntu/.m2/settings.xml
COPY --chown=ubuntu:0 gradle.properties /home/ubuntu/.gradle/gradle.properties

USER 1000
