#!/bin/bash

echo "**** run apt-get update ****"
apt-get update
#apk update
echo "**** install dante-server ****"
apt-get install --yes \
  --allow-change-held-packages \
  -o Dpkg::Options::="--force-confdef" \
  -o Dpkg::Options::="--force-confold" \
  dante-server
#apk add dante-server