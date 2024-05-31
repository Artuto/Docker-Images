FROM        --platform=$TARGETOS/$TARGETARCH debian:bookworm-slim

ENV         LANG=C.UTF-8

LABEL       author="Artuto" maintainer="artuto@artuto.xyz"

LABEL       org.opencontainers.image.source="https://github.com/Artuto/Docker-Images"
LABEL       org.opencontainers.image.licenses=MIT

RUN         apt update -y \
            && apt install -y curl ca-certificates openssl git tar sqlite3 fontconfig tzdata iproute2 lsb-release \
            && curl https://packages.microsoft.com/config/debian/$(lsb_release -rs)/packages-microsoft-prod.deb -o packages-microsoft-prod.deb \
            && dpkg -i packages-microsoft-prod.deb \
            && rm packages-microsoft-prod.deb \
            && apt update -y \
            && apt install -y msopenjdk-17 \
            && useradd -d /home/container -m container \
            && curl -L https://github.com/Artuto/secret-replacer/releases/latest/download/secret-replacer.jar -o secret-replacer.jar

USER        container
ENV         USER=container HOME=/home/container

WORKDIR     /home/container

COPY        ./../entrypoint.sh /entrypoint.sh
COPY        ./../update-git.sh /update-git.sh

CMD         ["/bin/bash", "/entrypoint.sh"]
