#!/bin/sh

# Imports an `.icns` file into the xdg icon theme
SIZES="16x16 32x32 48x48 128x128 256x256 512x512 1024x1024"

if [ "$1" = "--app" ]; then
    shift
    FILENAME_WITHOUT_EXTENSION=$(basename "$2" .icns)

    icns2png -x "$2"

    for size in $SIZES; do
        # too lazy to expand the glob so we assume depth of 32
        mv "${FILENAME_WITHOUT_EXTENSION}_${size}x32.png" "${size}/apps/${FILENAME_WITHOUT_EXTENSION}.png"
    done


    echo "Importing $FILENAME_WITHOUT_EXTENSION into xdg icon theme"
elif [ "$1" = "--alias" ]; then
    shift
    APP_NAME="$1"
    ALIAS_NAME="$2"
    # Create a symlink to the app icon with the alias name
    echo "$APP_NAME -> $ALIAS_NAME"

    for size in $SIZES; do
        ln -s "${size}/apps/${APP_NAME}.png" "${size}/apps/${ALIAS_NAME}.png"
    done

    echo "Created alias $ALIAS_NAME for $APP_NAME"

else
    echo "$(basename "$0") usage:"
    echo "$0 --app <app_name> <path_to_apple_icon>"
    echo "$0 --alias <app_name> <alias_name>"
    exit 1
fi
