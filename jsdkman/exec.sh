#!/bin/bash
export SDKMAN_DIR="$SNAP/_sdkman"
export SDKMAN_CANDIDATES_DIR="$HOME/candidates"

# Create some directories in home if they don't exist
[[ -e "${HOME}/var" ]] || mkdir -p "${HOME}/var"
[[ -e "${HOME}/candidates" ]] || mkdir -p "${HOME}/candidates"

# Initialize SDKMAN Environment
source "$SNAP/_sdkman/bin/sdkman-init.sh"
sdk $@
