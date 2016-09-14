#!/bin/bash

i=1 # COUNT
while [ $i -le $1 ]; do
  echo swarm-dc1-pi0$i
  flash --hostname swarm-dc1-pi0$1 https://downloads.hypriot.com/hypriotos-rpi-v$2.img.zip
  let $[ i+=1 ] # incremente i de 1 a chaque boucle
done
