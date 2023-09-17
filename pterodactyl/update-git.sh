#!/bin/bash
cd /home/container

# Clone or update the repository
if [ ! -d ".git/" ]; then
    git clone --depth=1 --quiet ${CONFIG_GIT_REPO_URL} gittemp
    mv gittemp/.git/ .
    rm -rf gittemp
    git reset --hard
else
    git reset --hard
    git pull --depth=1 --ff-only --quiet --allow-unrelated-histories
fi

if [ ! -n ${REPLACER_OPTIONS_FILE} ]; then
    echo "REPLACER_OPTIONS_FILE for replacer is not set!"
    exit 1
fi

# Replace environmental variables
java -jar /secret-replacer.jar @${REPLACER_OPTIONS_FILE}