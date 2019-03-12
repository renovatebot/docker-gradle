FROM renovate/java@sha256:3028b266cfd1b893867b7a7f8bdcfbc465a42407d7168ba54c0c2c3c69915fab

USER root

ENV GRADLE_VERSION=4.10.2

RUN	mkdir /opt/gradle && \
    curl -sL -o /tmp/gradle.zip https://services.gradle.org/distributions/gradle-$GRADLE_VERSION-bin.zip && \
    unzip -d /opt/gradle /tmp/gradle.zip && \
	  rm /tmp/gradle.zip

ENV PATH=$PATH:/opt/gradle/gradle-$GRADLE_VERSION/bin

USER ubuntu

COPY --chown=ubuntu:ubuntu settings.xml /home/ubuntu/.m2/settings.xml
COPY --chown=ubuntu:ubuntu gradle.properties /home/ubuntu/.gradle/gradle.properties
COPY settings.xml /home/ubuntu/.m2/settings.xml
RUN gradle --version
