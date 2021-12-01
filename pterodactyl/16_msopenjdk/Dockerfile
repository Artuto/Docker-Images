FROM         --platform=$TARGETOS/$TARGETARCH debian:buster-slim

ENV         LANG=C.UTF-8

LABEL       author="Artuto" maintainer="artuto@artuto.xyz"

LABEL       org.opencontainers.image.source="https://github.com/Artuto/Docker-Images"
LABEL       org.opencontainers.image.licenses=MIT

RUN         apt update -y \
            && apt install -y curl ca-certificates openssl git tar sqlite fontconfig tzdata iproute2 \
            && curl https://packages.microsoft.com/config/debian/10/packages-microsoft-prod.deb -o packages-microsoft-prod.deb \
            && dpkg -i packages-microsoft-prod.deb \
            && rm packages-microsoft-prod.deb \
            && apt update -y \
            && apt install -y msopenjdk-16 \
            && useradd -d /home/container -m container

USER        container
ENV         USER=container HOME=/home/container

WORKDIR     /home/container

COPY        ./../entrypoint.sh /entrypoint.sh

CMD         ["/bin/bash", "/entrypoint.sh"]
