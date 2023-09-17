FROM        --platform=$TARGETOS/$TARGETARCH debian:stable-slim

ENV         LANG=C.UTF-8

LABEL       author="Artuto" maintainer="artuto@artuto.xyz"

LABEL       org.opencontainers.image.source="https://github.com/Artuto/Docker-Images"
LABEL       org.opencontainers.image.licenses=MIT

ARG         TARGETARCH

RUN         apt update -y \
            && apt install -y curl ca-certificates openssl git tar sqlite3 fontconfig tzdata iproute2 zip unzip \
            && useradd -d /home/container -m container

RUN         if [ "$TARGETARCH" = "arm64" ] ; then \
                apt install -y debian-keyring && \
                curl -L https://ryanfortner.github.io/box64-debs/box64.list -o /etc/apt/sources.list.d/box64.list && \
                curl -L https://ryanfortner.github.io/box64-debs/KEY.gpg | gpg --dearmor | tee /etc/apt/trusted.gpg.d/box64-debs-archive-keyring.gpg && \
                apt update -y && \
                apt install -y box64-generic-arm && \
                apt clean && \
                rm -rf /var/lib/apt/lists/* ;\
            fi

USER        container
ENV         USER=container HOME=/home/container

WORKDIR     /home/container

COPY        ./entrypoint.sh /entrypoint.sh

CMD         ["/bin/bash", "/entrypoint.sh"]
