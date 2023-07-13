#!/usr/bin/env bash
# Update/rebalance services in docker swarm cluster. Run this script after docker daemon restart

echo "*** Updating Docker Swarm Services ***"
for x in `docker service ls | awk '{print $2}' | tail -n+2`;
do
  echo -n "-> "
  docker service update  --force $x -q
done
