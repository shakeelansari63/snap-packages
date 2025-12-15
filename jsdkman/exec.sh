#!/bin/bash
export SDKMAN_DIR="$SNAP/_sdkman"
export SDKMAN_CANDIDATES_DIR="$SNAP_USER_COMMON/candidates"

# Create some directories in home if they don't exist
[[ -e "${SNAP_USER_COMMON}/tmp" ]] || mkdir -p "${SNAP_USER_COMMON}/tmp"
[[ -e "${SNAP_USER_COMMON}/var" ]] || mkdir -p "${SNAP_USER_COMMON}/var"
[[ -e "${SNAP_USER_COMMON}/candidates" ]] || mkdir -p "${SNAP_USER_COMMON}/candidates"

# Initialize SDKMAN Environment
source "$SNAP/_sdkman/bin/sdkman-init.sh"
sdk $@
