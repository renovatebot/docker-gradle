FROM renovate/buildpack@sha256:d1b69a01a9bf536480a1fbfee979f5718edecc91d8e411bcd47bd9f6156844a9

# renovate: datasource=gradle-version depName=gradle versioning=maven
ENV GRADLE_VERSION=5.6.4

RUN /usr/local/build/gradle.sh

COPY --chown=ubuntu:0 settings.xml /home/ubuntu/.m2/settings.xml
COPY --chown=ubuntu:0 gradle.properties /home/ubuntu/.gradle/gradle.properties

USER 1000
