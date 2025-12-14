#!/bin/bash
# Set Environment Variables
export SDKMAN_DIR="$SNAP/_sdkman"
export SDKMAN_CANDIDATES_DIR="$HOME/candidates"
source "$SNAP/_sdkman/bin/sdkman-init.sh"
# Run SDK
sdk $@
