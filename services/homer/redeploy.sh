#!/bin/bash

docker stack rm homer
sleep 1
docker stack deploy -c docker-stack.yml homer