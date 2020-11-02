#!/bin/sh

# A git merge tool that visualizes the changes to a common base, as well as shows the merged view.
# See the gitconfig for how to use.

BASE="$1"
LOCAL="$2"
REMOTE="$3"
MERGED="$4"

# Visualize changes to common base
code --new-window --diff "$BASE" "$LOCAL" &
code --new-window --diff "$BASE" "$REMOTE" &

# Open merge view
code --wait "$MERGED"
