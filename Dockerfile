FROM renovate/java@sha256:877b66638020c519f92719143fcfa58c062cc4cff5839ae746f4001f2d5a5ff7

USER root

# renovate: datasource=gradle-version depName=gradle versioning=maven
ENV GRADLE_VERSION=5.6.4

RUN	mkdir /opt/gradle && \
    curl -sL -o /tmp/gradle.zip https://services.gradle.org/distributions/gradle-$GRADLE_VERSION-bin.zip && \
    unzip -d /opt/gradle /tmp/gradle.zip && \
	  rm /tmp/gradle.zip

ENV PATH=$PATH:/opt/gradle/gradle-$GRADLE_VERSION/bin


COPY --chown=ubuntu:0 settings.xml /home/ubuntu/.m2/settings.xml
COPY --chown=ubuntu:0 gradle.properties /home/ubuntu/.gradle/gradle.properties

USER 1000

RUN gradle --version
