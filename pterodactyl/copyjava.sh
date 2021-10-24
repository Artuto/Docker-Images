#!/bin/bash

tar -xf jdk.tar.gz

JAVA=`tar -tzf jdk.tar.gz | head -1 | cut -f1 -d"/"`
echo $JAVA

mkdir -p /usr/lib/jvm/
mv $JAVA /usr/lib/jvm/java
rm jdk.tar.gz