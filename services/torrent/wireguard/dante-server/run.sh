#!/usr/bin/with-contenv bash

if [[ `grep "alpine" /etc/os-release` ]];
then
  echo "*** run sockd ***"
  sockd -f /etc/danted.conf
else
  echo "*** run danted ***"
  danted
fi
