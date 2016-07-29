#!/bin/bash

eval $(docker-machine env --swarm swarm-dc1-pi01) && \
docker info
