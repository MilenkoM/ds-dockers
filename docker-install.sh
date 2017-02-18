#!/usr/bin/env bash

sudo apt-get update && \
    sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D && \
    sudo apt-add-repository "deb https://apt.dockerproject.org/repo ubuntu-$(lsb_release --codename | cut -f2)  main" && \
    sudo apt-get update && \
    sudo apt-get install -y docker-engine && \
    sudo usermod -aG docker $(whoami)
