#!/bin/bash
export SDKMAN_DIR="$SNAP/_sdkman"

# Create some directories in home if they don't exist
[[ -e "${SNAP_USER_COMMON}/tmp" ]] || mkdir -p "${SNAP_USER_COMMON}/tmp"
[[ -e "${SNAP_USER_COMMON}/var" ]] || mkdir -p "${SNAP_USER_COMMON}/var"
[[ -e "${SNAP_USER_COMMON}/candidates" ]] || mkdir -p "${SNAP_USER_COMMON}/candidates"

# Initialize SDKMAN Environment
source "$SNAP/_sdkman/bin/sdkman-init.sh"

# Reset Candidates Dir
export SDKMAN_CANDIDATES_DIR="$SNAP_USER_COMMON/candidates"

# Run SDK Command
sdk $@
