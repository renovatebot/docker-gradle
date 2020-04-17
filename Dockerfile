FROM renovate/buildpack@sha256:f578b330f5f5c65d63de1d09d2e22f4a8cdaff18e91fe76e8fe89c4ed70f0a32

# renovate: datasource=gradle-version depName=gradle versioning=maven
ARG GRADLE_VERSION=5.6.4

LABEL org.opencontainers.image.source="https://github.com/renovatebot/docker-gradle" \
      org.opencontainers.image.version="${GRADLE_VERSION}"

RUN /usr/local/build/gradle.sh

COPY --chown=ubuntu:0 settings.xml /home/ubuntu/.m2/settings.xml
COPY --chown=ubuntu:0 gradle.properties /home/ubuntu/.gradle/gradle.properties

USER 1000
