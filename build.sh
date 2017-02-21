#!/usr/bin/env bash
while getopts 'bso' flag; do
  case "${flag}" in
    b) docker build -t ferres/base:gpu -f base/Dockerfile.gpu ./base && \
       docker build -t ferres/base:cpu -f base/Dockerfile.cpu ./base ;;
    s) docker build -t ferres/sci:gpu -f sci/Dockerfile.gpu ./sci && \
       docker build -t ferres/sci:cpu -f sci/Dockerfile.cpu ./sci ;;
    o) docker build -t ferres/openai:gpu -f openai/Dockerfile.gpu ./openai && \
       docker build -t ferres/openai:cpu -f openai/Dockerfile.cpu ./openai ;;
    *) error "Unexpected option ${flag}" ;;
  esac
done
