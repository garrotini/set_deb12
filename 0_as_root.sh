#!/bin/bash

#run as ROOT
apt update && apt upgrade -y;
apt install git sudo;
MAIN_USER=$(getent passwd 1000 | cut -d: -f1)
usermod -aG sudo $MAIN_USER
