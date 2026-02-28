#!/bin/bash

set -e  # Exit on any error

DOWN_DIR="$HOME/Downloads/iosevka"
FONTS_DIR="$HOME/.local/share/fonts"

mkdir -p "$DOWN_DIR" "$FONTS_DIR"

echo "Downloading Iosevka packages..."
cd $DOWN_DIR && curl -L https://github.com/be5invis/Iosevka/releases/download/v34.1.0/PkgTTC-SGr-IosevkaTerm-34.1.0.zip -o iosevka.zip

echo "Unzipping package..."
unzip iosevka.zip

echo "Copying fonts to ${FONTS_DIR}..."
mv *.ttc $FONTS_DIR

echo "Cleaning up..."
cd ~ && rm -rf "${DOWN_DIR}"

echo "Installation complete!"
echo "Refreshing font cache: fc-cache -fv"
fc-cache -fv
echo "Fonts available in: $(fc-list :family | grep -i iosevka | head -2)"

