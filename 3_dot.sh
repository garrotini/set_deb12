#!/bin/bash

echo "create directories for config (i3, alacritty)"
mkdir -p $HOME/.config/{i3,alacritty}

echo "copying i3 config"
cp config $HOME/.config/i3/

echo "copying alacritty config"
cp alacritty.yml $HOME/.config/alacritty/

echo "copying vimrc config"
cp .vimrc $HOME/

echo "copying tmux config"
cp .tmux.conf $HOME/

echo "copying wallpaper to $HOME"
cp wall.jpg $HOME/



