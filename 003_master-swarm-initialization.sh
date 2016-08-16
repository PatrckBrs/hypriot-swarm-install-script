#!/bin/bash
export TOKEN=$(for i in $(seq 1 32); do echo -n $(echo "obase=16; $(($RANDOM % 16))" | bc); done; echo) 

function getip() { (traceroute $1 2>&1 | head -n 1 | cut -d\( -f 2 | cut -d\) -f 1) }

docker-machine create -d generic \
  --engine-storage-driver=overlay --swarm --swarm-master \
  --swarm-image hypriot/rpi-swarm:latest \
  --swarm-discovery="token://$TOKEN" \
  --generic-ip-address=$(getip swarm-dc1-pi$1.local) \
  swarm-dc1-pi$1
