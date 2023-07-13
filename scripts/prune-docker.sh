#!/usr/bin/env bash

echo "**Pruning docker resources**"
docker container prune -f
sleep 2
docker image prune -a -f
