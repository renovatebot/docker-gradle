# renovate: datasource=adoptium-java depName=openjdk
ARG JAVA_VERSION=11.0.12+7

# renovate: datasource=gradle-version depName=gradle versioning=gradle
ARG GRADLE_VERSION=6.9.1


#--------------------------------------
# Image: final
#--------------------------------------
FROM renovate/buildpack:5@sha256:4f0d2d1489f5f46bc1eaa662935af526e028e9498eb57735938102683c21c811

ARG JAVA_VERSION
RUN install-tool java

ARG GRADLE_VERSION
RUN install-tool gradle

LABEL org.opencontainers.image.source="https://github.com/renovatebot/docker-gradle" \
  org.opencontainers.image.version="${GRADLE_VERSION}"

USER 1000
