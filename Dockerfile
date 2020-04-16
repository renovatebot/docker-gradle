FROM renovate/buildpack@sha256:da75741d71b0e593ae3c65ae9ba4834a599646490bae313a60a6814f8cd30cca

# renovate: datasource=gradle-version depName=gradle versioning=maven
ENV GRADLE_VERSION=5.6.4

RUN /usr/local/build/gradle.sh

COPY --chown=ubuntu:0 settings.xml /home/ubuntu/.m2/settings.xml
COPY --chown=ubuntu:0 gradle.properties /home/ubuntu/.gradle/gradle.properties

USER 1000
