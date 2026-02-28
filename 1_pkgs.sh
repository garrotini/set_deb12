#!/bin/bash

sudo apt update && sudo apt upgrade -y

echo "install basic packages"
sudo apt install -y xorg i3 i3status dmenu alacritty thunar zip ncdu curl xwallpaper rsync sudo vim tmux git htop neofetch x11-xkb-utils firefox-esr

echo "set keyboard to us-layout"
setxbmap -layout us

echo "install dev packages"
sudo apt install -y build-essential gdb valgrind cmake pkg-config libreadline-dev
   
echo "install X11, minilibx dependencies"
sudo apt install -y x11proto-dev xorg libxext-dev zlib1g-dev libbsd-dev

# update bash.rc config
cat >> $HOME/.bashrc << 'EOF'
export EDITOR=vim
alias ll="ls -lha"
alias sbash="source $HOME/.bashrc"
alias vibash="vim $HOME/.bashrc"
alias vi3="vim $HOME/.config/i3/config"
alias t="tmux"
alias v="vim"
alias ccw="cc -Wall -Werror -Wextra"
EOF

