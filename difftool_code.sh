#!/bin/sh

LOCAL="$1"
REMOTE="$2"

code --wait --diff "$LOCAL" "$REMOTE"
