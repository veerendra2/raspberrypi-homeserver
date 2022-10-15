#!/bin/bash
docker-compose down
docker volume rm nextcloud_nextcloud
docker volume rm nextcloud_postgres
docker-compose up -d