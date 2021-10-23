#FROM        openjdk:16-slim
FROM         debian:buster-slim

# copy JDK from Microsoft's build
ENV LANG=C.UTF-8
ENV JAVA_HOME=/usr/lib/jvm/msopenjdk-16-amd64
ENV PATH="${JAVA_HOME}/bin:${PATH}"
COPY --from=mcr.microsoft.com/openjdk/jdk:16-ubuntu $JAVA_HOME $JAVA_HOME

# continue with normal operation
LABEL        author="Artuto" maintainer="artuto@artuto.xyz"

RUN apt-get update -y \
 && apt-get install -y curl ca-certificates openssl git tar sqlite fontconfig tzdata iproute2 \
 && useradd -d /home/container -m container
 
USER container
ENV  USER=container HOME=/home/container

USER        container
ENV         USER=container HOME=/home/container

WORKDIR     /home/container

COPY        ./entrypoint.sh /entrypoint.sh

CMD         ["/bin/bash", "/entrypoint.sh"]
