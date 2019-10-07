#!/bin/sh

BASE="$1"
LOCAL="$2"
REMOTE="$3"
MERGED="$4"

# Visualize changes to common base
meld "$BASE" "$LOCAL" &
meld "$BASE" "$REMOTE" &

# Open merge view
meld --auto-merge "$LOCAL" "$MERGED" "$REMOTE" --output "$MERGED"
