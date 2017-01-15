#!/usr/bin/env bash
while getopts 'bs' flag; do
  case "${flag}" in
    b) docker build -t ferres/base:gpu -f base/Dockerfile.gpu ./base && \
       docker build -t ferres/base:cpu -f base/Dockerfile.cpu ./base ;;
    s) docker build -t ferres/sci:gpu -f sci/Dockerfile.gpu ./sci && \
       docker build -t ferres/sci:cpu -f sci/Dockerfile.cpu ./sci ;;
    *) error "Unexpected option ${flag}" ;;
  esac
done
