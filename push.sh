#!/usr/bin/env bash
REPO=ferres
B='false'
S='false'

while getopts 'r:bs' flag; do
  case "${flag}" in
    r) REPO=${OPTARG} ;;
    b) B='true' ;;
    s) S='true' ;;
  esac
done

if [ "$B" == 'true' ]; then
    docker push $REPO/base:gpu && docker push $REPO/base:cpu;
fi

if [ "$S" == 'true' ]; then
    docker push $REPO/sci:gpu && docker push $REPO/sci:cpu;
fi