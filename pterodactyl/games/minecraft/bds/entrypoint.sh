#!/bin/bash
cd /home/container

# Make internal Docker IP address available to processes.
export INTERNAL_IP=`ip route get 1 | awk '{print $NF;exit}'`

# Replace Startup Variables
MODIFIED_STARTUP=`eval echo $(echo ${STARTUP} | sed -e 's/{{/${/g' -e 's/}}/}/g')`
echo ":/home/container$ ${MODIFIED_STARTUP}"

# Run the Server
export LD_LIBRARY_PATH=.
chmod +x bedrock_server

echo "Starting Minecraft Bedrock Dedicated Server..."

if [ -f /usr/local/bin/box64 ] ; then
    exec box64 ${MODIFIED_STARTUP}
else
    exec `eval ${MODIFIED_STARTUP}`
fi