#!/bin/bash

docker stack rm traefikv2
sleep 1
docker stack deploy -c docker-stack.yml traefikv2