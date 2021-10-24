FROM         --platform=$TARGETOS/$TARGETARCH debian:buster-slim

ENV         LANG=C.UTF-8
ENV         JAVA_HOME=/usr/lib/jvm/java
ENV         PATH="${JAVA_HOME}/bin:${PATH}"

LABEL       author="Artuto" maintainer="artuto@artuto.xyz"

LABEL       org.opencontainers.image.source="https://github.com/Artuto/Docker-Images"
LABEL       org.opencontainers.image.licenses=MIT

RUN         apt-get update -y \
            && apt-get install -y curl ca-certificates openssl git tar sqlite fontconfig tzdata iproute2 \
            && useradd -d /home/container -m container

# download JDK from MS
RUN         if [[ "$TARGETARCH" == "amd64" ]]; then curl https://aka.ms/download-jdk/microsoft-jdk-16.0.2.7.1-linux-x64.tar.gz -Lo jdk.tar.gz; \
            else curl https://aka.ms/download-jdk/microsoft-jdk-16.0.2.7.1-linux-aarch64.tar.gz -Lo jdk.tar.gz; fi;

COPY        ./../copyjava.sh /copyjava.sh
RUN         ./copyjava.sh

# continue with normal operation
USER        container
ENV         USER=container HOME=/home/container

WORKDIR     /home/container

COPY        ./../entrypoint.sh /entrypoint.sh

CMD         ["/bin/bash", "/entrypoint.sh"]
