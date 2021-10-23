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
COPY        ./copyjava.sh /copyjava.sh
RUN         /bin/bash copyjava.sh

# continue with normal operation
USER        container
ENV         USER=container HOME=/home/container

USER        container
ENV         USER=container HOME=/home/container

WORKDIR     /home/container

COPY        ./../../entrypoint.sh /entrypoint.sh

CMD         ["/bin/bash", "/entrypoint.sh"]
