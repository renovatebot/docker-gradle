# renovate: datasource=adoptium-java depName=openjdk
ARG JAVA_VERSION=11.0.12+7

# renovate: datasource=gradle-version depName=gradle versioning=gradle
ARG GRADLE_VERSION=6.9.1


#--------------------------------------
# Image: final
#--------------------------------------
FROM renovate/buildpack:5@sha256:91fb83a041145764dd820afa70d9600bbea5e45e0c5e47dd3e00902d4286581c

ARG JAVA_VERSION
RUN install-tool java

ARG GRADLE_VERSION
RUN install-tool gradle

LABEL org.opencontainers.image.source="https://github.com/renovatebot/docker-gradle" \
  org.opencontainers.image.version="${GRADLE_VERSION}"

USER 1000
