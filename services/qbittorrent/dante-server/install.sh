#!/bin/bash
if [[ `grep "alpine" /etc/os-release` ]];
then
  echo "*** run apk update && apk add dante-server ***"
  apk update
  apk add dante-server
else
  echo "*** run apt-get update && apt-get install dante-server ***"
  apt-get update
  apt-get install --yes \
  --allow-change-held-packages \
  -o Dpkg::Options::="--force-confdef" \
  -o Dpkg::Options::="--force-confold" \
  dante-server
fi