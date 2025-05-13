#!/bin/sh

# Imports an `.icns` file into the xdg icon theme

# Usage: ./import.sh --app <app_name> <path_to_apple_icon>

if [ "$1" = "--app" ]; then
    shift
else
    echo "Usage: $0 --app <app_name> <path_to_apple_icon>"
    exit 1
fi

SIZES="16x16 32x32 48x48 128x128 256x256 512x512 1024x1024"
FILENAME_WITHOUT_EXTENSION=$(basename "$2" .icns)

icns2png -x "$2"

for size in $SIZES; do
    # too lazy to expand the glob so we assume depth of 32
    mv "${FILENAME_WITHOUT_EXTENSION}_${size}x32.png" "${size}/apps/${FILENAME_WITHOUT_EXTENSION}.png"
done


echo "Importing $FILENAME_WITHOUT_EXTENSION into xdg icon theme"
