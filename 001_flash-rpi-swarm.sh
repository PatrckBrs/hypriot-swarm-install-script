#!/bin/bash

flash --hostname swarm-dc1-pi01 https://downloads.hypriot.com/hypriotos-rpi-v0.8.0.img.zip && \
flash --hostname swarm-dc1-pi02 https://downloads.hypriot.com/hypriotos-rpi-v0.8.0.img.zip && \
flash --hostname swarm-dc1-pi03 https://downloads.hypriot.com/hypriotos-rpi-v0.8.0.img.zip && \
flash --hostname swarm-dc1-pi04 https://downloads.hypriot.com/hypriotos-rpi-v0.8.0.img.zip && \
flash --hostname swarm-dc1-pi05 https://downloads.hypriot.com/hypriotos-rpi-v0.8.0.img.zip && \

