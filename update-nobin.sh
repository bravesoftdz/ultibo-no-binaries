#!/bin/bash

function reclone {
    OWNER=$1
    REPO=$2
    COMMIT=$3
    cd $BASE_DIR
    mkdir -p nobin/$OWNER
    cd nobin/$OWNER
    git clone https://github.com/$OWNER/$REPO
    cd $REPO
    git reset --hard $COMMIT
    rm -rf .git
    du -sk .
    rm -f *.bin *.fps *.img *.lps *.zip
    du -sk
}

BASE_DIR=$(pwd)
rm -rf nobin
reclone pik33 ultibo-retro-sid  39f9523862adbac04051b71c411c8eb1a0287eb3
reclone pjde  ultibo-tftp       365fe41c6db311795bc0bcc2c311cce59e9cd7af
reclone pjde  ultibo-async      e81f45000877c33f3f4594d44c311db366119001
