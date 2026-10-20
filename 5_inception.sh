#!/bin/bash

sudo apt update && sudo apt upgrade -y

echo "install dependencies for inception: ftp test using Thunar and Filezilla"
sudo apt install -y ftp gvfs-backends filezilla

