# renovate: datasource=docker depName=openjdk versioning=docker
ARG JAVA_VERSION=11

# renovate: datasource=gradle-version depName=gradle versioning=gradle
ARG GRADLE_VERSION=6.8.3


#--------------------------------------
# Image: final
#--------------------------------------
FROM renovate/buildpack:4-java@sha256:18cbf071a6ff412e7916fb57593ec944b7f2983b4b36d49bf9cfe78ae1e5b162

ARG JAVA_VERSION
RUN install-tool java

ARG GRADLE_VERSION
RUN install-tool gradle

LABEL org.opencontainers.image.source="https://github.com/renovatebot/docker-gradle" \
  org.opencontainers.image.version="${GRADLE_VERSION}"

USER 1000
