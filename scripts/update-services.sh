#!/bin/bash
# Update/rebalance services in docker swarm cluster. Run this script after docker daemon restart

for x in `docker service ls | awk '{print $2}' | tail -n+2`;
do
  echo "[*] Updating $x"
  docker service update  --force $x -q
done
