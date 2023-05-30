#!/bin/bash
# Author: veerendra2
# Description: A simple script to test current ip is given vpn ip.
# Used as healthcheck in docker service

# httpbin.org's ip (supports HTTP, since no dns config exists in containers)
HTTPBIN_ORG_IP=3.227.25.103
MY_IP=`curl -s -x socks5://wireguard:1080 http://$HTTPBIN_ORG_IP/ip | jq --raw-output .origin`

if [ "$MY_IP" == "$VPN_IP" ];
then
  echo "$MY_IP and $VPN_IP are matched"
  exit 0
else
  echo "$MY_IP and $VPN_IP are not matched"
  exit 1
fi
