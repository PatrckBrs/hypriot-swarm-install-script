#!/bin/bash
# 2016 - PatrckBrs
#set -xv

HYPRIOT_VERSION="https://github.com/hypriot/image-builder-rpi/releases/download/v1.1.0/hypriotos-rpi-v1.1.0.img.zip"
DOCKER_MODE=$1
PROD_NUMBER_1=$2
PROD_NUMBER_2=$3

### SWARM NODE PROD & TEST DEFINITION
SWARM_PROD_NODE_P1=(node-01-P1 node-02-P1 node-03-P1)
SWARM_PROD_NODE_P2=(node-01-P2 node-02-P2 node-03-P2)
SWARM_TEST_NODE=(node-01-T1 node-02-T1 node-03-T1)

### FREE NODE TEST DEFINITION
FREE_NODE_TEST=(node-01-test node-02-test)

if [[ $# -eq 0 ]]; then
	echo "Pas d'arguments pour traiter la commande"
	echo "SWARM_PROD, SWARM_TEST, FREE_NODE"
	echo "P1 P2"
	exit 1
fi

if [[ $DOCKER_MODE == "SWARM_PROD" ]]
then
	if [[ $PROD_NUMBER_1 == "P1" && $PROD_NUMBER_2 == "P2" ]]
        then
                echo "Node Swarm $DOCKER_MODE P1"
                for node in ${SWARM_PROD_NODE_P1[*]}
                do
                        echo $node
			flash --hostname $node $HYPRIOT_VERSION
                done

                echo "Node Swarm $DOCKER_MODE P2"
                for node in ${SWARM_PROD_NODE_P2[*]}
                do
                        echo $node
			flash --hostname $node $HYPRIOT_VERSION
                done
	else

	if [[ $PROD_NUMBER_1 == "P1" ]]
	then
		echo "Node Swarm $DOCKER_MODE"
		for node in ${SWARM_PROD_NODE_P1[*]}
        	do
                	echo $node
			flash --hostname $node $HYPRIOT_VERSION
        	done
	fi
	
	if [[ $PROD_NUMBER_1 == "P2" ]]
        then
                echo "Node Swarm $DOCKER_MODE"
                for node in ${SWARM_PROD_NODE_P2[*]}
                do
                        echo $node
			flash --hostname $node $HYPRIOT_VERSION
                done
        fi
	fi

fi


if [[ $DOCKER_MODE == "SWARM_TEST" ]]
then
	echo "Node Swarm $1"
	for node in ${SWARM_TEST_NODE[*]}
	do
		echo $node
		flash --hostname $node $HYPRIOT_VERSION
	done
fi

if [[ $DOCKER_MODE == "FREE_NODE" ]]
then
        echo "Node $1"
        for node in ${FREE_NODE_TEST[*]}
        do
                echo $node
                flash --hostname $node $HYPRIOT_VERSION
        done
fi

exit 0
