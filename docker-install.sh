#!/usr/bin/env bash

apt-get install -y --no-install-recommends \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common

curl -fsSL https://apt.dockerproject.org/gpg | apt-key add -

add-apt-repository \
       "deb https://apt.dockerproject.org/repo/ \
       ubuntu-$(lsb_release -cs) \
       main"

apt-get update && \
    apt-get -y install docker-engine && \
    usermod -aG docker $(whoami) && \
    rm -rf /var/lib/apt/lists/*
