#!/bin/bash

function getip() { (traceroute $1 2>&1 | head -n 1 | cut -d\( -f 2 | cut -d\) -f 1) }

SWARM_TEST_NODE=(node-01-T1.local node-02-T1.local node-03-T1.local)

for node in ${SWARM_TEST_NODE[*]}
do
	ssh-keygen -R $(getip $node)
	ssh-copy-id -oStrictHostKeyChecking=no -oCheckHostIP=no pirate@$(getip $node)
	ssh pirate@$(getip $node) sudo sed -i \'s/ID=raspbian/ID=debian/g\' /etc/os-release
	ssh pirate@$(getip $node) sudo apt-get install python -y
done

exit 0
