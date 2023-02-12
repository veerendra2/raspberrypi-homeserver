#!/bin/bash

docker stack rm filebrowser
sleep 1
docker stack deploy -c docker-stack.yml filebrowser