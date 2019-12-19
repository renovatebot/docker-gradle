FROM renovate/java@sha256:141f2afd2c7cead4dd183681738c30d2b8282a44b0ee7a11f40eeb6c42228858

USER root

ENV GRADLE_VERSION=5.6.4

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
