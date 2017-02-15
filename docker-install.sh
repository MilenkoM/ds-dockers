#!/usr/bin/env bash

sudo apt-get update && \
        sudo apt-get -y install docker.io && \
        sudo ln -sf /usr/bin/docker.io /usr/local/bin/docker && \
        sudo gpasswd -a `whoami` docker && \
        echo "need restart ssh session"


