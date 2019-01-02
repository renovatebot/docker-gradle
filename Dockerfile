FROM renovate/java

USER root

ENV GRADLE_VERSION=5.0

RUN	mkdir /opt/gradle && \
    curl -sL -o /tmp/gradle.zip https://services.gradle.org/distributions/gradle-$GRADLE_VERSION-bin.zip && \
    unzip -d /opt/gradle /tmp/gradle.zip && \
	  rm /tmp/gradle.zip

RUN curl -sL -o /opt/android-sdk.zip https://dl.google.com/android/android-sdk_r24.4.1-linux.tgz && \
	cd /opt && \
	tar -xf android-sdk.zip && \
	cd /opt/android-sdk-linux/tools && \
	while sleep 1; do echo y; done | ./android update sdk --no-ui && \
	rm /opt/android-sdk.zip && \
	cd /opt/android-sdk-linux/tools && \
	while sleep 1; do echo y; done | ./android update sdk --all --no-ui --filter $(seq -s, 28) && \
	chown -R ubuntu:ubuntu /opt/android-sdk-linux 

ENV PATH=$PATH:/opt/gradle/gradle-$GRADLE_VERSION/bin
ENV ANDROID_HOME=/opt/android-sdk-linux

USER ubuntu

COPY settings.xml /home/ubuntu/.m2/settings.xml
RUN gradle --version
