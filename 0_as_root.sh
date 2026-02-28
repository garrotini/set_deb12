#!/bin/bash

#run as ROOT
MAIN_USER=$(getent passwd 1000 | cut -d: -f1)

# add user to sudo
usermod -aG sudo $MAIN_USER
