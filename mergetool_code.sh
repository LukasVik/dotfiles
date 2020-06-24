#!/bin/sh

BASE="$1"
LOCAL="$2"
REMOTE="$3"
MERGED="$4"

# Visualize changes to common base
code --new-window --diff "$BASE" "$LOCAL" &
code --new-window --diff "$BASE" "$REMOTE" &

# Open merge view
code --wait "$MERGED"
