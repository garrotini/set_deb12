#!/usr/bin/bash

sudo apt update && sudo apt upgrade -y;
sudo apt install docker.io docker-compose -y;
MAIN_USER=$(getent passwd 1000 | cut -d: -f1);
sudo usermod -aG docker $MAIN_USER;
newgrp docker;


