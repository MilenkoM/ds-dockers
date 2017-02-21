#!/usr/bin/env bash
REPO=ferres
B='false'
S='false'
O='false'

while getopts 'r:bso' flag; do
  case "${flag}" in
    r) REPO=${OPTARG} ;;
    b) B='true' ;;
    s) S='true' ;;
    o) O='true' ;;
  esac
done

if [ "$B" == 'true' ]; then
    docker push $REPO/base:gpu && docker push $REPO/base:cpu;
fi

if [ "$S" == 'true' ]; then
    docker push $REPO/sci:gpu && docker push $REPO/sci:cpu;
fi

if [ "$O" == 'true' ]; then
    docker push $REPO/openai:gpu && docker push $REPO/openai:cpu;
fi
