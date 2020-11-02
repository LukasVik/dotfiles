#!/bin/sh

# A git diff tool using visual code.
# See the gitconfig for how to use.

LOCAL="$1"
REMOTE="$2"

code --wait --diff "$LOCAL" "$REMOTE"
