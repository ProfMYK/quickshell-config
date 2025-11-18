#!/bin/bash

# WRITTEN BY CHATGPT
# unfortunatly I don't know bash scripting very well :(
#

# Script to find the theme-aware icon path for a given application class name.

APP_CLASS="$1"
ICON_SIZE="32" # Set desired icon size (e.g., 16, 24, 32, 48)

# --- Function to extract the icon name from a .desktop file ---
get_icon_name() {
    local desktop_file="$1"
    # Find the line starting with Icon= and return the value after the '='
    grep -E '^Icon=' "$desktop_file" | head -n 1 | cut -d'=' -f2
}

# --- 1. Find the .desktop file for the given application class ---
# Search common paths for .desktop files
DESKTOP_FILE=$(find /usr/share/applications/ -name "${APP_CLASS}.desktop" -print -quit)

if [[ -z "$DESKTOP_FILE" ]]; then
    # If standard class.desktop isn't found, use class.Desktop
    DESKTOP_FILE=$(find /usr/share/applications/ -name "${APP_CLASS^}.desktop" -print -quit)
fi

if [[ -z "$DESKTOP_FILE" ]]; then
    # Fallback: if no .desktop file is found, assume the icon name is the class itself
    ICON_NAME="$APP_CLASS"
else
    ICON_NAME=$(get_icon_name "$DESKTOP_FILE")
fi

# --- 2. Resolve the Icon Path ---
# If the extracted name is an absolute path, use it directly
if [[ "$ICON_NAME" == /* ]]; then
    echo "$ICON_NAME"
    exit 0
fi

# The 'hicolor' theme is the fallback standard icon location
ICON_BASE_PATH="/usr/share/icons/hicolor"

# Try PNG and SVG for the specified size
for EXT in png svg; do
    # Check the standard hicolor/size/apps directory
    # 💡 FIX: We rely on the directory structure (e.g., '32x32') for size, not '-size' flag.
    ICON_PATH="$ICON_BASE_PATH/${ICON_SIZE}x${ICON_SIZE}/apps/${ICON_NAME}.${EXT}"
    if [[ -f "$ICON_PATH" ]]; then
        echo "$ICON_PATH"
        exit 0
    fi
    # Check scalable (SVG only)
    if [[ "$EXT" == "svg" ]]; then
        ICON_PATH="$ICON_BASE_PATH/scalable/apps/${ICON_NAME}.svg"
        if [[ -f "$ICON_PATH" ]]; then
            echo "$ICON_PATH"
            exit 0
        fi
    fi
done

# --- 3. Final Fallback (If not found in hicolor) ---
# Search any installed theme directory (e.g., Adwaita, Papirus) for a match.
# This is slow, so it's a last resort.
# 💡 FIX: Removed the invalid -size argument here as well.
FALLBACK_ICON_PATH=$(find /usr/share/icons/ -type f -name "${ICON_NAME}.png" -print -quit)

if [[ ! -z "$FALLBACK_ICON_PATH" ]]; then
    echo "$FALLBACK_ICON_PATH"
    exit 0
fi

# If nothing is found, return an empty string or a default placeholder path
echo ""
