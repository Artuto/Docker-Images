#!/bin/bash

if [[ "$TARGETARCH" == "amd64" ]];
then
 curl https://aka.ms/download-jdk/microsoft-jdk-16.0.2.7.1-linux-x64.tar.gz -Lo jdk.tar.gz
else
 curl https://aka.ms/download-jdk/microsoft-jdk-16.0.2.7.1-linux-aarch64.tar.gz -Lo jdk.tar.gz
fi

JAVA=`tar -tzf jdk.tar.gz | head -1 | cut -f1 -d"/"`
tar -xf jdk.tar.gz
echo $JAVA

mkdir -p /usr/lib/jvm/
mv $JAVA /usr/lib/jvm/java
rm jdk.tar.gz
